from pagamento_strategy import PagamentoStrategy


class PagamentoPix(PagamentoStrategy):
    def pagar(self, valor):
        desconto = valor*0.10
        valorComDesconto = valor - desconto
        print(f"Pagamento de R${valorComDesconto} em PIX realizado com sucesso!")
        print(f"Valor do desconto à vista R${desconto}")