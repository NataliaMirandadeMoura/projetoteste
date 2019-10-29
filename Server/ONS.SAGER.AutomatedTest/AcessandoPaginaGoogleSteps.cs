using ONS.SAGER.AutomatedTest.Pages;
using ONS.SAGER.AutomatedTest.Utils;
using System;
using TechTalk.SpecFlow;

namespace ONS.SAGER.AutomatedTest
{
    [Binding]
    public class AcessandoPaginaGoogleSteps
    {

        private readonly ElementoDaHome _elementosDaHome;

        
        public AcessandoPaginaGoogleSteps()
        {
            _elementosDaHome = new ElementoDaHome(Hooks.RetornarDriver(Config.URL_HOME));
        }

        [Given(@"que estou na página do google")]
        public void DadoQueEstouNaPaginaDoGoogle()
        {
            Hooks.RegistrarPaginas();
        }
        
        [When(@"preencho o campo de pesquisa")]
        public void QuandoPreenchoOCampoDePesquisa()
        {
            ScenarioContext.Current.Pending();
        }
        
        [When(@"clico no enter")]
        public void QuandoClicoNoEnter()
        {
            ScenarioContext.Current.Pending();
        }
        
        [Then(@"o sistema muda de página")]
        public void EntaoOSistemaMudaDePagina()
        {
            ScenarioContext.Current.Pending();
        }
    }
}
