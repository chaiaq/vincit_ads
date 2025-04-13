namespace FaculdadeVincit.DesignPattern.StrategyPattern;

public class SacolaDeCompras
{
    public IPagamentoStrategy? Pagamento {get;set;}

    public void RealizarPagamento(double valor)
    {
        if (Pagamento == null)
        {
            System.Console.WriteLine("Método de pagamento ainda não informado!");
            return;
        }

        Pagamento.Pagar(valor);
    }
}
