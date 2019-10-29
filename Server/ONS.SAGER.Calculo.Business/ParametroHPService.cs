using ONS.SAGER.Calculo.Business.Impl;
using ONS.SAGER.Calculo.Business.Models.Entities;
using ONS.SAGER.Calculo.Business.Models.Requests;
using ONS.SAGER.Calculo.Business.Models.Value_Objects;
using ONS.SAGER.DataAccess.Interfaces;
using ONS.SDK.Context;
using ONS.SDK.Worker;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Business
{
    public class ParametroHPService : DomainServiceBase, IParametroHPService
    {
        private static readonly string NOME_TIPO_CALCULO = "HP";
        private readonly IExecutionContext _executionContext;
        private readonly IEventoRepository _eventoRepository;
        private readonly IUnidadeGeradoraRepository _unidadeGeradoraRepository;

        public ParametroHPService(
            IExecutionContext executionContext,
            IEventoRepository eventoRepository,
            IUnidadeGeradoraRepository unidadeGeradoraRepository)
        {
            _executionContext = executionContext;
            _eventoRepository = eventoRepository;
            _unidadeGeradoraRepository = unidadeGeradoraRepository;
        }

        [SDKEvent(CalculoEvent.ConcluirCalculoParametroHP)]
        public async Task Executar(CalcularParametroHPModel model)
        {
            // Parametrizar a execução
            _executionContext.ExecutionParameter.Context.Memory.Commit = true;
            _executionContext.ExecutionParameter.SynchronousPersistence = false;
            _executionContext.ExecutionParameter.MemoryEvent.Branch = model.CenarioId;

            // Gerar meses desde a data de inicio até a data de fim
            // TODO: Analisar comportamento caso data fim venha em um dia diferente do último dia do mês.
            var periodoCalculo = ExtrairListaMesesDoPeriodo(model.DataInicio, model.DataFim).OrderBy(e => e.PrimeiroMinuto());

            var unidadeGeradora = await _unidadeGeradoraRepository.ObterPorId(model.UnidadeGeradoraId);

            if (unidadeGeradora is null)
            {
                throw new InvalidOperationException($"{nameof(unidadeGeradora)} não pode ser nula");
            }

            // Obter suspensoes de uma unidade geradora em um determinado cenário
            var suspensoesUnidadesGeradoras = _unidadeGeradoraRepository.ObterSuspensoes(unidadeGeradora.Id, model.CenarioId);

            // Obter eventos de uma unidade geradora para período
            var eventos = _eventoRepository.ObterEventos(periodoCalculo.First().PrimeiroMinuto(), periodoCalculo.Last().UltimoMinutoMes(), unidadeGeradora.Id);

            await Task.WhenAll(suspensoesUnidadesGeradoras, eventos);

            // Calcular!
            var mesesCalculados = CalcularHP(unidadeGeradora, suspensoesUnidadesGeradoras.Result, eventos.Result, periodoCalculo);

            // Conclusão e consolidação = Emissão de evento e persistência.
            foreach (var mesCalculado in mesesCalculados)
            {
                EmitEvent(CalculoEvent.ConcluirCalculoParametroHP, new ConcluirParametroHPModel()
                {
                    CenarioId = model.CenarioId,
                    UnidadeGeradoraId = unidadeGeradora.Id,
                    MesAno = mesCalculado.MesAno.PrimeiroMinuto(),
                    // Colocar em algum arquivo de configuração
                    NomeTipoCalculo = NOME_TIPO_CALCULO

                }, reuseContext: false);

                // TODO: Criar lógica de consolidação
                //var consolidacaoMensal = _consolidacaoMensalDataRepository.ObterConsolidacoesMensasPorMesesAnos(new List<string> { mesAno.ToString() }).FirstOrDefault();
                //_parametroTaxaDataRepository.Inserir(model.IdConfiguracaoCenario, uge.IdUge, consolidacaoMensal.IdConsolidacaoMensal, duracaoEventosNoMes.TotalHours);
            }
        }

        private List<CalculoParametroHP> CalcularHP(UnidadeGeradora unidadeGeradora, IEnumerable<SuspensaoUnidadeGeradora> suspensoesUnidadesGeradoras, List<EventoMudancaEstadoOperativo> eventos, IOrderedEnumerable<Data> periodoCalculo)
        {
            // TODO: Verificar regra e se há necessidade de existirem os 2 campos envolvidos na lógica.
            // TODO: Verificar se é adequado encapsular lógica dentro de algum método.
            var entradaOperacaoComercial = unidadeGeradora.DataEventoEOC ?? unidadeGeradora.DataEntradaOperacao.Value;
            var mesesCalculados = new List<CalculoParametroHP>();

            foreach (var mesAno in periodoCalculo)
            {
                var duracaoTotal = new TimeSpan();

                var periodoInicio = mesAno.PrimeiroMinuto();
                var periodoFim = mesAno.PrimeiroMinutoProximoMes();

                var dataInicio = entradaOperacaoComercial < periodoInicio ? periodoInicio : entradaOperacaoComercial;
                var dataFim = unidadeGeradora.DataDesativacao is null || unidadeGeradora.DataDesativacao.Value > periodoFim ? periodoFim : unidadeGeradora.DataDesativacao;

                for (LinkedListNode<EventoMudancaEstadoOperativo> evento = EventosNoPeriodo(eventos, dataInicio, dataFim).First; evento != null;)
                {
                    var duracao = CalcularDuracao(evento);

                    if (dataFim.HasValue && evento.Value.DataVerificada + duracao > dataFim)
                        duracao = dataFim.Value - (DateTime)evento.Value.DataVerificada;
                    if (suspensoesUnidadesGeradoras.Any())
                        duracao = RecalcularDuracaoEventoConsiderandoSuspensoesUge(suspensoesUnidadesGeradoras, (DateTime)evento.Value.DataVerificada, duracao);
                    duracaoTotal += duracao;
                }
                mesesCalculados.Add(new CalculoParametroHP()
                {
                    MesAno = mesAno,
                    Resultado = duracaoTotal
                });
            }
            return mesesCalculados;
        }
        
        // TODO: Verificar se na passagem de mês o cálculo continua funcionando corretamente.
        private TimeSpan CalcularDuracao(LinkedListNode<EventoMudancaEstadoOperativo> referencia, DateTime? fim = null)
        {
            var dataVerificada = referencia.Value.DataVerificada ??
                throw new ArgumentException("Data verificada é nula.");
            var proximaVerificada = referencia.Next != null ?
                referencia.Next.Value.DataVerificada ??
                throw new ArgumentException("Data verificada é nula.") : new DateTime(dataVerificada.AddMonths(1).Year, dataVerificada.AddMonths(1).Month, 1, 0, 0, 0);

            return fim.HasValue && fim < proximaVerificada ? fim.Value - dataVerificada : proximaVerificada - dataVerificada;
        }

        private TimeSpan RecalcularDuracaoEventoConsiderandoSuspensoesUge(IEnumerable<SuspensaoUnidadeGeradora> suspensoes, DateTime dataVerificada, TimeSpan duracaoEvento)
        {
            var periodoEvento = new Periodo(dataVerificada, dataVerificada + duracaoEvento);

            var suspensoesAfetamDuracaoEvento = suspensoes.Where(suspensao =>
                suspensao.Periodo.Intersecao(periodoEvento)
            ).ToList();
            if (!suspensoes.Any() || !suspensoesAfetamDuracaoEvento.Any()) return duracaoEvento;

            var duracaoSuspensoesDentroEvento = new TimeSpan();
            suspensoesAfetamDuracaoEvento.ForEach(susp =>
            {
                duracaoSuspensoesDentroEvento += ObterDuracaoSuspensaoDentroDoEvento(periodoEvento.Inicio, periodoEvento.Fim.Value, susp);
            });
            return duracaoSuspensoesDentroEvento > duracaoEvento ? new TimeSpan() : duracaoEvento - duracaoSuspensoesDentroEvento;
        }

        private TimeSpan ObterDuracaoSuspensaoDentroDoEvento(DateTime dataInicioEvento, DateTime dataFimEvento, SuspensaoUnidadeGeradora suspensao)
        {
            TimeSpan duracaoSuspensao = new TimeSpan();
            var duracaoEvento = (dataFimEvento - dataInicioEvento);
            if (suspensao.Periodo.Fim.HasValue)
            {
                if (suspensao.Periodo.Inicio >= dataInicioEvento)
                    duracaoSuspensao += TimeSpan.FromHours(Math.Abs((suspensao.Periodo.Inicio - dataInicioEvento).TotalHours));
                if (suspensao.Periodo.Fim <= dataFimEvento)
                    duracaoSuspensao += TimeSpan.FromHours(Math.Abs((suspensao.Periodo.Fim.Value - dataFimEvento).TotalHours));
                if (suspensao.Periodo.Inicio <= dataInicioEvento && suspensao.Periodo.Fim >= dataFimEvento)
                    return duracaoEvento;
            }
            else
            {
                duracaoSuspensao = TimeSpan.FromHours(Math.Abs((dataInicioEvento - suspensao.Periodo.Inicio).TotalHours));
            }
            return (duracaoEvento - duracaoSuspensao).TotalHours < 0 ? new TimeSpan() : duracaoEvento - duracaoSuspensao;
        }

        private LinkedList<EventoMudancaEstadoOperativo> EventosNoPeriodo(IEnumerable<EventoMudancaEstadoOperativo> eventos, DateTime dataInicio, DateTime? dataFim)
        {
            var filtradoPorData = dataFim.HasValue ? eventos.Where(e => e.DataVerificada >= dataInicio && e.DataVerificada <= dataFim.Value).ToList() : eventos.Where(e => e.DataVerificada >= dataInicio);
            return new LinkedList<EventoMudancaEstadoOperativo>(filtradoPorData);
        }

        private ICollection<Data> ExtrairListaMesesDoPeriodo(DateTime inicio, DateTime fim)
        {
            var listaMeses = new List<Data>();
            inicio = new DateTime(inicio.Year, inicio.Month, 1).Date;

            while (inicio < fim)
            {
                listaMeses.Add(new Data(inicio.Year, inicio.Month));
                inicio = inicio.AddMonths(1);
            }

            return listaMeses;
        }
    }
}


