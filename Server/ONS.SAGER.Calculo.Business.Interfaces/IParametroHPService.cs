using ONS.SAGER.Calculo.Business.Models.Requests;
using System.Threading.Tasks;

namespace Business
{
    public interface IParametroHPService
    {
        Task Executar(CalcularParametroHPModel model);
    }
}
