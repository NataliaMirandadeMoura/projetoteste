using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace ONS.SAGER.AutomatedTest.Utils
{
    public sealed class Hooks
    {
        private static IWebDriver driver;

        private Hooks()
        {

        }

        public static IWebDriver RegistrarPaginas()
        {
            ChromeOptions opcoes = new ChromeOptions();
            opcoes.AddArgument("--lang=pt");
            var path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            driver = new ChromeDriver(path, opcoes);
            driver.Manage().Window.Maximize();
            return driver;

        }
        public static IWebDriver RetornarDriver(string url)
        {
            driver.Navigate().GoToUrl(url);
            return driver;
          
        }

        [AfterTestRun]
        public static void AfterTestRun()
        {
            driver.Quit();
        }
    }
}
