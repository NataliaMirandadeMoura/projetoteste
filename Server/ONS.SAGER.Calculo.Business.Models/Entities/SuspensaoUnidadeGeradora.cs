using ONS.SAGER.Calculo.Business.Models.Value_Objects;
using System;

namespace ONS.SAGER.Calculo.Business.Models.Entities
{
    public class SuspensaoUnidadeGeradora
    {
        public string UsinaId { get; set; }
        public string UnidadeGeradoraId { get; set; }
        public Periodo Periodo { get; set; }
    }
}
