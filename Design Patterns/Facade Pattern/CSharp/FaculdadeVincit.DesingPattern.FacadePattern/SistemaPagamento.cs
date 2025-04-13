namespace FaculdadeVincit.DesingPattern.FacadePattern;

public class SistemaPagamento
{
    public void ProcessarPagamento(decimal valor)
    {
        System.Console.WriteLine($"Pagamento de valor R$ {valor} processado com sucesso");
    }
}
