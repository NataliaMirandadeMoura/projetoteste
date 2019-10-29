using ONS.SAGER.Calculo.Business.Models.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ONS.SAGER.DataAccess.Interfaces
{
    public interface IEventoRepository
    {
        Task<List<EventoMudancaEstadoOperativo>> ObterEventos(DateTime inicioPeriodo, DateTime fimPeriodo, string unidadeGeradoraId);
    }
}
