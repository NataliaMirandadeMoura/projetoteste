using ONS.SAGER.AutomatedTest.Utils;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ONS.SAGER.AutomatedTest.Pages
{
    public class ElementoDaHome: PaginaBase
    {
        public ElementoDaHome(IWebDriver navegador) : base(navegador)
        {
        }
        public IWebElement LogoHome => RetornarElementoPorNome("q");
       
    }
}
