public class LojaFacade {
    private ProcessadorPedidos processadorPedidos;
    private SistemaPagamentos sistemaPagamentos;
    private SistemEnvio sistemaEnvio;

    public LojaFacade() {
        processadorPedidos = new ProcessadorPedidos();
        sistemaEnvio = new SistemEnvio();
        sistemaPagamentos = new SistemaPagamentos();
    }

        public void fazerPedido(String item, double valor) {
            processadorPedidos.CriarPedido(item);
            sistemaPagamentos.ProcessarPagamento(valor);
            sistemaEnvio.EnviarPedido(item);

            System.out.println("Pedido realizado com sucesso");
        }

}
