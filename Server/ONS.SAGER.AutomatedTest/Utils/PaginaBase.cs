using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ONS.SAGER.AutomatedTest.Utils
{
    public abstract class PaginaBase
    {
        public IWebDriver driver;

        protected PaginaBase(IWebDriver _driver)
        {
            driver = _driver;
        }

        protected IWebElement RetornarElementoPorNome(string nome) => driver.FindElement(By.Name(nome));

        protected IWebElement RetornarElementoPorId(string id) => driver.FindElement(By.Id(id));

        protected IWebElement RetornarElementoPorClass(string classe) => driver.FindElement(By.ClassName(classe));

    }
}
