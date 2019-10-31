using Microsoft.Extensions.Configuration;
using ONS.SAGER.Calculo.AutomatedTest.Extensions;
using ONS.SAGER.Calculo.AutomatedTest.Extensions.ONS.SAGER.Calculo.AutomatedTest.Extensions;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;

namespace Selenium.Utils.Utils
{

    public class BrowserContext { 
    private readonly Browser _browser;
    public IConfiguration Configuration { get; }
    public IWebDriver WebDriver { get; }

        public BrowserContext(Browser browser, IConfiguration configuration)
    {
            _browser = browser;
            Configuration = configuration;

            string caminhoDriver = null;
            if (browser == Browser.Firefox)
            {
                caminhoDriver = "gecko.exe".ToApplicationPath("driver");
            }
            else if (browser == Browser.Chrome)
            {
                caminhoDriver = "chromedriver.exe".ToApplicationPath("driver");
            }
            else
            {
                throw new Exception("Navegador não conhecido");
            }

            WebDriver = WebDriverFactory.CreateWebDriver(
                browser, caminhoDriver, true);
        }
}
}

