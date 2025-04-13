namespace FaculdadeVincit.DesignPattern.StrategyPattern;

public class PagamentoPix : IPagamentoStrategy
{
    public void Pagar(double valor)
    {
        var desconto = valor *0.10;
        var valorComDesconto = valor - desconto;
        System.Console.WriteLine($"Pagamento de R$ {valorComDesconto} por PIX recebido com sucesso!");
        System.Console.WriteLine($"Desconto por pagamento à vista: R$ {desconto}");
    }

}
