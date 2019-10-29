//using Microsoft.Extensions.Configuration;
//using ONS.SAGER.Calculo.AutomationTest.Pages;
//using Selenium.Utils.Utils;
//using System;
//using System.Collections.Generic;
//using System.IO;
//using System.Text;
//using Xunit;

//namespace ONS.SAGER.Calculo.AutomationTest.Tests
//{
//    public class GoogleTests
//    {
//        private IConfiguration _configuration;


//        public GoogleTests()
//        {
//            var path = new ConfigurationBuilder()
//               .SetBasePath(Directory.GetCurrentDirectory());

//            var builder = path
//                .AddJsonFile($"appsettings.json");

//            _configuration = builder.Build();
//        }

//        [Theory]
//        [InlineData(Browser.Chrome, "Google")]
//        [InlineData(Browser.Chrome, "Google1")]
//        [InlineData(Browser.Chrome, "Google2")]
//        public void TestarPesquisaNoGoogle(
//            Browser browser, string texto)
//        {
//            var browserContext = new BrowserContext(browser, _configuration);var browserContext = new BrowserContext(browser, _configuration);

//            using (var tela1 = new GooglePage(browserContext))
//            using (var tela2 = new PesquisaGoogle(browserContext))
//            {
//                tela1.CarregarPagina();
//                tela1.PreencheCampoDeTexto(texto);
//                tela1.SubmiterAPesquisa();

//                Assert.True(tela2.AcharBotao());
//            }




//        }
//    }
//}