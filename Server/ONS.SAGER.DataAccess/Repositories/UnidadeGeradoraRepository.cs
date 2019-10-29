using ONS.SAGER.Calculo.Business.Models.Entities;
using ONS.SAGER.DataAccess.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ONS.SAGER.DataAccess.Repositories
{
    internal class UnidadeGeradoraRepository : IUnidadeGeradoraRepository
    {
        public async Task<UnidadeGeradora> ObterPorId(string id)
        {
            throw new System.NotImplementedException();
        }

        public async Task<ICollection<UnidadeGeradora>> ObterPorIds(IEnumerable<string> ids)
        {
            throw new System.NotImplementedException();
        }

        public async Task<ICollection<SuspensaoUnidadeGeradora>> ObterSuspensoes(string unidadeGeradorasId, string cenarioId)
        {
            return await ObterSuspensoes(new List<string>() { unidadeGeradorasId }, cenarioId);
        }

        public async Task<ICollection<SuspensaoUnidadeGeradora>> ObterSuspensoes(IEnumerable<string> unidadesGeradorasIds, string cenarioId)
        {
            throw new System.NotImplementedException();
        }
    }
}
