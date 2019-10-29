using Newtonsoft.Json;
using ONS.SAGER.Calculo.UnitTests;
using System;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace ONS.SAGER.Calculo.IntegrationTests
{
    public class CalculoIntegrationTests : IClassFixture<TestServerFixture>
    {
        private readonly TestServerFixture _fixture;

        public CalculoIntegrationTests(TestServerFixture fixture)
        {
            _fixture = fixture;
        }

        [Fact]
        public async Task CalcularParametroHP()
        {
            // Arrange
            var calculo = new {
                DataInicio = new DateTime(2016, 10, 10),
                DataFim = new DateTime(),
                CenarioId = "123456789",
                UnidadeGeradoraId = "987654321"
            };

            var content = NewStringContent(calculo);

            // Act
            var response = await _fixture.Client.PostAsync("Calculo", content);

            // Assert
            Assert.Equal((int)HttpStatusCode.Accepted, 202);
        }


        #region Auxiliares
        public static StringContent NewStringContent(object obj)
        {
            return new StringContent(JsonConvert.SerializeObject(obj), Encoding.UTF8, "application/json");
        }
        #endregion

    }
}
