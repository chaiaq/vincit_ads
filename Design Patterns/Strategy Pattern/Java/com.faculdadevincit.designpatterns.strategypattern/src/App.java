public class App {
    public static void main(String[] args) throws Exception {
        SacolaDeCompras sacola = new SacolaDeCompras();

        sacola.setPagamento(new PagamentoCheque());
        sacola.realizarPagamento(1800);
        System.out.println();

        sacola.setPagamento(new PagamentoCredito());
        sacola.realizarPagamento(1800);
        System.out.println();

        sacola.setPagamento(new PagamentoPix());
        sacola.realizarPagamento(1800);
        System.out.println();
    }
}
