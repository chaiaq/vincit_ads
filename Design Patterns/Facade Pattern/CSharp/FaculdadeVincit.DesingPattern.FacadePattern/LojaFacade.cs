namespace FaculdadeVincit.DesingPattern.FacadePattern;

public class LojaFacade
{
    private readonly ProcessadorPedidos _processadorPedidos;
    private readonly SistemaPagamento _sistemaPagamento;
    private readonly SistemaEnvio _sistemaEnvio;

    public LojaFacade()
    {
        _processadorPedidos = new ProcessadorPedidos();
        _sistemaPagamento = new SistemaPagamento();
        _sistemaEnvio = new SistemaEnvio();
    }

    public void FazerPedido(string item, decimal valor)
    {
        _processadorPedidos.CriarPedido(item);
        _sistemaPagamento.ProcessarPagamento (valor);
        _sistemaEnvio.EnviarPedido(item);

        System.Console.WriteLine("Pedido realizado com sucesso");
    }
}
