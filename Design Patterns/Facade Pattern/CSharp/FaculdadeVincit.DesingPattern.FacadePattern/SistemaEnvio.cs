namespace FaculdadeVincit.DesingPattern.FacadePattern;

public class SistemaEnvio
{
    public void EnviarPedido(string item)
    {
        System.Console.WriteLine($"Pedido do item {item} enviado com sucesso");
    }
}
