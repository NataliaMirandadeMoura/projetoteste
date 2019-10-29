using System;

namespace ONS.SAGER.Calculo.Business.Models.Entities
{
    public class UnidadeGeradora
    {
        public string Id { get; set; }
        public string UsinaId { get; set; }
        public string AgenteId { get; set; }
        public string OnsId { get; set; }
        public DateTime? DataEntradaOperacao { get; set; }
        public DateTime? DataEventoEOC { get; set; }
        public DateTime? DataDesativacao { get; set; }
    }
}
