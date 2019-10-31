using Microsoft.Extensions.Configuration;
using ONS.SAGER.Calculo.AutomatedTest.Extensions.ONS.SAGER.Calculo.AutomatedTest.Extensions;
using ONS.SAGER.Calculo.AutomationTest.Pages;
using Selenium.Utils.Utils;
using TechTalk.SpecFlow;

namespace ONS.SAGER.Calculo.AutomatedTest
{
    public class StepsBase
    {
        public StepsBase()
        {
            var fileName = "appsettings.json";

            var path = new ConfigurationBuilder()
                .SetBasePath(fileName.ToApplicationPath());

            var builder = path
               .AddJsonFile(fileName);

            _configuration = builder.Build();


            _browserContext = new BrowserContext(Browser.Chrome, _configuration);

        }

        protected readonly IConfiguration _configuration;
        protected static BrowserContext _browserContext;

        
    }
}