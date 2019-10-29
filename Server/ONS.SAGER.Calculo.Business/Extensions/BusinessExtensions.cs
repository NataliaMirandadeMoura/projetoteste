using Business;
using Microsoft.Extensions.DependencyInjection;

namespace ONS.SAGER.Calculo.Business.Impl.Extensions
{
    public static class BusinessExtensions
    {
        public static void AddBusinessServices(this IServiceCollection services)
        {
            services.AddScoped<IParametroHPService, ParametroHPService>();
        }
    }
}
