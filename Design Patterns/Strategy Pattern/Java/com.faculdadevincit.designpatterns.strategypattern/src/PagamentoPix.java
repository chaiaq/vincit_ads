public class PagamentoPix implements IPagamentoStrategy{

    @Override
    public void pagar(double valor) {
        double desconto = valor *0.10;
        double valorComDesconto = valor - desconto;
        System.out.println("Pagamento de R$" + valorComDesconto + " em PIX realizado com sucesso!");
        System.out.println("Desconto no valor de R$" + desconto);
    }

}
