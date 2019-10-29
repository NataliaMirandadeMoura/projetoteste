using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ONS.SAGER.Calculo.Business.Models.Entities
{
    public class EventoMudancaEstadoOperativo : IEquatable<EventoMudancaEstadoOperativo>
    {
        [Display(Name = "Identificador Samug")]
        public string IdentificadorSamug { get; set; }

        [Display(Name = "Número ONS")]
        public string NumeroOns { get; set; }

        [Display(Name = "Id da UGE")]
        public string UnidadeGeradoraId { get; set; }

        [Display(Name = "Id do Agente")]
        public string AgenteId { get; set; }

        [Display(Name = "Data Verificada")]
        public DateTime? DataVerificada { get; set; }

        // TODO: Verificar esse nome
        [Display(Name = "Disponibilidade Disponível")]
        public double? DisponibilidadeDisponivel { get; set; }

        [Display(Name = "Status do evento")]
        public string Status { get; set; }

        public string ComentarioAgente { get; set; }

        public string ComentarioONS { get; set; }

        public DateTime? DataUltimaConsolidacao { get; set; }

        [Display(Name = "Estado Operativo")]
        public string EstadoOperativo { get; set; }

        [Display(Name = "Condição Operativo")]
        public string CondicaoOperativo { get; set; }

        [Display(Name = "Classificação de Origem")]
        public string ClassificacaoOrigem { get; set; }

        public string VersaoOficial { get; set; }

        public string VersaoCenario { get; set; }

        public bool HouveAlteracaoDuranteConsistencia { get; set; }

        public EventoMudancaEstadoOperativo Origem { get; set; }

        #region "Funcionalidades de comparação"
        public bool Equals(EventoMudancaEstadoOperativo other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;

            return string.Equals(NumeroOns, other.NumeroOns);
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != GetType()) return false;

            return Equals((EventoMudancaEstadoOperativo)obj);
        }

        public override int GetHashCode() => NumeroOns is null ? NumeroOns.GetHashCode() : 0;
        #endregion

    }
}
