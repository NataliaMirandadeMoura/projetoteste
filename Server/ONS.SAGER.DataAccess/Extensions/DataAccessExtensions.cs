using Microsoft.Extensions.DependencyInjection;
using ONS.SAGER.DataAccess.Interfaces;
using ONS.SAGER.DataAccess.Repositories;

namespace ONS.SAGER.DataAccess.Extensions
{
    public static class DataAccessExtensions
    {
        public static void AddRepositories(this IServiceCollection services)
        {
            services.AddScoped<IUnidadeGeradoraRepository, UnidadeGeradoraRepository>();
            services.AddScoped<IEventoRepository, EventoRepository>();
        }
    }
}
