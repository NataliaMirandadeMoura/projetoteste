using System;

namespace ONS.SAGER.Calculo.Business.Models.Value_Objects
{
    public class Periodo
    {
        public virtual DateTime Inicio { get; }
        public virtual DateTime? Fim { get; }

        public Periodo(DateTime inicio, DateTime? fim)
        {
            Inicio = inicio;
            Fim = fim;
        }

        public Periodo() { }

        public bool Intersecao(Periodo outro)
        {
            return (!Fim.HasValue && Inicio < outro.Fim) ||
                (!outro.Fim.HasValue && Fim > outro.Inicio) ||
                (!Fim.HasValue && !outro.Fim.HasValue) ||
                Inicio < outro.Fim && outro.Inicio < Fim;
        }

        public bool Contem(DateTime date)
        {
            return (Fim.HasValue && date >= Inicio && date <= Fim.Value) || (!Fim.HasValue && date >= Inicio);
        }
    }
}
