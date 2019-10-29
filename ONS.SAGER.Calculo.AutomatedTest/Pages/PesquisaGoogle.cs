using Microsoft.Extensions.Configuration;
using OpenQA.Selenium;
using Selenium.Utils.Utils;
using System;
using System.Collections.Generic;
using System.Text;

namespace ONS.SAGER.Calculo.AutomationTest.Pages
{
    public class PesquisaGoogle : PageBase
    {
        private readonly IConfiguration _configuration;

        public PesquisaGoogle(BrowserContext browserContext)
            : base(browserContext.WebDriver)
        {
            _configuration = browserContext.Configuration;
        }

        public bool AcharBotao()
        {
            string botao = _driver.GetText(
                 By.Id("gsr")).ToString();

            return !string.IsNullOrEmpty(botao);
        }
    }
}
