using Microsoft.Extensions.Configuration;
using ONS.SAGER.Calculo.AutomatedTest.Extensions;
using ONS.SAGER.Calculo.AutomatedTest.Extensions.ONS.SAGER.Calculo.AutomatedTest.Extensions;
using ONS.SAGER.Calculo.AutomationTest.Pages;
using Selenium.Utils.Utils;
using System;
using System.IO;
using TechTalk.SpecFlow;

namespace ONS.SAGER.Calculo.AutomatedTest
{
    [Binding]
    public class FazerPesquisaNoGoogleSteps : StepsBase
    {
        private GooglePage _googlePage;
        private static PesquisaGoogle _pesquisaGoogle;

        public FazerPesquisaNoGoogleSteps() : base()
        {
            _googlePage = new GooglePage(_browserContext);
            _pesquisaGoogle = new PesquisaGoogle(_browserContext);
        }

        [Given(@"que  eu estou na página do Google")]
        public void DadoQueEuEstouNaPaginaDoGoogle()
        {
            _googlePage.CarregarPagina();
        }
        
        [When(@"eu preencher o campo")]
        public void QuandoEuPreencherOCampo()
        {
            _googlePage.PreencheCampoDeTexto("google1");
        }

        [When(@"clico  no botão de pesquisa")]
        public void QuandoClicoNoBotaoDePesquisa()
        {
            _googlePage.SubmiterAPesquisa();
        }
        
        [Then(@"o  sistema exibe o resultado da pesquisa")]
        public void EntaoOSistemaExibeOResultadoDaPesquisa()
        {
            _pesquisaGoogle.AcharBotao();
            _pesquisaGoogle.TakeScreenshot(@"c:\Screenshot\EntaoOSistemaExibeOResultadoDaPesquisa\", $"{DateTime.Now.ToString("dd_MM_yyyy_HH_mm_ss")}.png");
        }

        [AfterTestRun]
        public static void Fechar()
        {
            _pesquisaGoogle.Fechar();
        }
    }
}
