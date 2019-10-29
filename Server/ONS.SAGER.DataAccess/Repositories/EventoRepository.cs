using ONS.SAGER.Calculo.Business.Models.Entities;
using ONS.SAGER.DataAccess.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ONS.SAGER.DataAccess.Repositories
{
    public class EventoRepository : IEventoRepository
    {
        public async Task<List<EventoMudancaEstadoOperativo>> ObterEventos(DateTime inicioPeriodo, DateTime fimPeriodo, string unidadeGeradoraId)
        {
            return new List<EventoMudancaEstadoOperativo>()
            {
                new EventoMudancaEstadoOperativo()
                {
                    NumeroOns = Guid.NewGuid().ToString(),
                    DataVerificada = new DateTime(2018, 3, 2)
                },
                new EventoMudancaEstadoOperativo()
                {
                    NumeroOns = Guid.NewGuid().ToString(),
                    DataVerificada = new DateTime(2018, 3, 4)
                },
                new EventoMudancaEstadoOperativo()
                {
                    NumeroOns = Guid.NewGuid().ToString(),
                    DataVerificada = new DateTime(2018, 3, 5)
                }
            };
        }
    }
}
