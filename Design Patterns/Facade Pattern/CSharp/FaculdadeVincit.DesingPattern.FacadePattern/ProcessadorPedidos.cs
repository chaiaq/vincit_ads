namespace FaculdadeVincit.DesingPattern.FacadePattern;

public class ProcessadorPedidos
{
    public void CriarPedido(string item)
    {
        System.Console.WriteLine($"Pedido para o item {item} criado");
    }
}
