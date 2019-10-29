using System;
using System.Net;
using System.Threading.Tasks;
using Business;
using Microsoft.AspNetCore.Mvc;
using ONS.Sager.Calculo.API.Models;
using ONS.SAGER.Calculo.Business.Models.Requests;
using ONS.SDK.Worker;

namespace Template.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CalculoController : ControllerBase
    {
        //private readonly ISDKWorker _sdk;

        public CalculoController()
        {
            //_sdk = sdk;
        }

        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.Accepted)]
        [ProducesResponseType(typeof(ErroResponse), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.InternalServerError)]
        public async Task<IActionResult> Calcular(CalcularParametroHPModel model)
        {
            // TODO: Levar lógica para business
            model.DataInicio = new DateTime(model.DataInicio.Year, model.DataInicio.Month, 1).Date;
            model.DataFim = new DateTime(model.DataFim.Year, model.DataFim.Month, 1).AddMonths(1).AddMinutes(-1);

            //await Task.Run(() => 
            //    _sdk.Run(model, CalculoEvent.RealizarCalculoParametroHP))
            //    .ConfigureAwait(false);

            return Accepted();
        }
    }
}
