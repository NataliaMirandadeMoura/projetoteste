using ONS.SAGER.Calculo.Business.Models.Value_Objects;
using ONS.SDK.Context;
using System;

namespace ONS.SAGER.Calculo.Business.Models.Requests
{
    public class ConcluirParametroHPModel : IPayload
    {
        public string CenarioId { get; set; }
        public string UnidadeGeradoraId { get; set; }
        public DateTime MesAno { get; set; }
        public string NomeTipoCalculo { get; set; }
    }
}
