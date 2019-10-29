using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.ApplicationParts;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.ViewComponents;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.PlatformAbstractions;
using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using Template;

namespace ONS.SAGER.Calculo.UnitTests
{
    public class TestServerFixture : IDisposable
    {
        private readonly TestServer _testServer;
        public HttpClient Client { get; }

        protected virtual void InitializeServices(IServiceCollection services)
        {
            var startupAssembly = typeof(Startup).Assembly;

            var manager = new ApplicationPartManager
            {
                ApplicationParts =
                {
                    new AssemblyPart(startupAssembly)
                },
                FeatureProviders =
                {
                    new ControllerFeatureProvider(),
                    new ViewComponentFeatureProvider()
                }
            };

            services.AddSingleton(manager);
        }

        public TestServerFixture()
        {
            try
            {
                var path = GetContentRootPath();

                var builder = new WebHostBuilder()
                    .UseContentRoot(path)
                    .ConfigureServices(InitializeServices)
                    .UseEnvironment("Development")
                    .UseConfiguration(new ConfigurationBuilder()
                        .SetBasePath(path)
                        .AddJsonFile("appsettings.json")
                        .Build())
                    .UseStartup<Startup>();

                _testServer = new TestServer(builder);

                Client = _testServer.CreateClient();

                Client.BaseAddress = new Uri("http://localhost:51412");
                Client.DefaultRequestHeaders.Accept.Clear();
                Client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            }
            catch (Exception e)
            {
                throw new Exception("Não foi possível configurar o servidor para testes de integração", e);
            }

        }

        private string GetContentRootPath()
        {
            var testProjectPath = PlatformServices.Default.Application.ApplicationBasePath;
            // TODO: Pegar caminho pelo arquivo startup
            var relativePathToHostProject = @"..\..\..\..\ONS.Sager.Calculo.API";
            return Path.Combine(testProjectPath, relativePathToHostProject);
        }

        public void Dispose()
        {
            Client.Dispose();
            _testServer.Dispose();
        }
    }
}
