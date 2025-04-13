namespace FaculdadeVincit.DesignPattern.StrategyPattern;

public class PagamentoComCartaoCredito : IPagamentoStrategy
{
    public void Pagar(double valor)
    {
        var acrescimo = valor *0.10;
        var valorComAcrescimo = valor + acrescimo;
        System.Console.WriteLine($"Pagamento de R$ {valorComAcrescimo} por cartão de crédito recebido com sucesso!");
        System.Console.WriteLine($"Valor do acréscimo por pagamento com crédito R$ {acrescimo}");
    }

}
