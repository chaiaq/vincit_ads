public class PagamentoCredito implements IPagamentoStrategy{

    @Override
    public void pagar(double valor) {
        double acrescimo = valor *0.10;
        double valorComAcrescimo = valor + acrescimo;
        System.out.println("Pagamento de R$" + valorComAcrescimo + " em Cartão de Crédito realizado com sucesso!");
        System.out.println("Acréscimo no valor de R$" + acrescimo);
    }

}
