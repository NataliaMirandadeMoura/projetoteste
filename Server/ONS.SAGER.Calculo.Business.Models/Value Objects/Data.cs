using System;

namespace ONS.SAGER.Calculo.Business.Models.Value_Objects
{
    // TODO: Melhorar essa classe, tornar mais genérica
    public class Data
    {
        public Data(int ano, int mes)
        {
            if (mes < 1 || mes > 12)
            {
                throw new Exception($"Valor inválido para mes: {mes}");
            }

            if (ano < 1 || ano > 9999)
            {
                throw new Exception($"Valor inválido para ano: {ano}");
            }

            Valor = new DateTime(ano, mes, 1);
        }

        public DateTime Valor { get; }
        public DateTime PrimeiroMinuto() => Valor.Date;
        public DateTime PrimeiroMinutoProximoMes() => Valor.AddMonths(1).Date;
        public DateTime UltimoMinutoMes() => Valor.AddMonths(1).AddMinutes(-1);
        public override string ToString() => $"{Valor.Year}-{Valor.Month}";
    }
}
