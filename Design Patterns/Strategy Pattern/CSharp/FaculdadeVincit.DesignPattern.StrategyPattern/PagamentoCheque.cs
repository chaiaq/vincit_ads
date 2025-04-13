namespace FaculdadeVincit.DesignPattern.StrategyPattern;

public class PagamentoCheque : IPagamentoStrategy
{
    public void Pagar(double valor)
    {
        System.Console.WriteLine($"Pagamento de R$ {valor} em cheque realizado com sucesso!");
    }
}
