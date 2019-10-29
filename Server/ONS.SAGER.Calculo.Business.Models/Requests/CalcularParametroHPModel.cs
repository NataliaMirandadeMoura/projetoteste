using ONS.SDK.Context;
using System;

namespace ONS.SAGER.Calculo.Business.Models.Requests
{
    public class CalcularParametroHPModel : IPayload
    {
        public CalcularParametroHPModel()
        {
        }

        public CalcularParametroHPModel(
            DateTime dataInicio,
            DateTime dataFim,
            string configuracaoCenarioId,
            string unidadeGeradoraId)
        {
            DataInicio = dataInicio;
            DataFim = dataFim;
            CenarioId = configuracaoCenarioId;
            UnidadeGeradoraId = unidadeGeradoraId;
        }

        public DateTime DataInicio { get; set; }
        public DateTime DataFim { get; set; }
        public string CenarioId { get; set; }
        public string UnidadeGeradoraId { get; set; }
    }
}
