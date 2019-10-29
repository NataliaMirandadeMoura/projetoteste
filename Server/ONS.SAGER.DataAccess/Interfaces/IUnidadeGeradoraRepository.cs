using ONS.SAGER.Calculo.Business.Models.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ONS.SAGER.DataAccess.Interfaces
{
    public interface IUnidadeGeradoraRepository
    {
        Task<UnidadeGeradora> ObterPorId(string id);
        Task<ICollection<UnidadeGeradora>> ObterPorIds(IEnumerable<string> ids);
        Task<ICollection<SuspensaoUnidadeGeradora>> ObterSuspensoes(string UnidadeGeradorasId, string cenarioId);
        Task<ICollection<SuspensaoUnidadeGeradora>> ObterSuspensoes(IEnumerable<string> UnidadesGeradorasIds, string cenarioId);
    }
}
