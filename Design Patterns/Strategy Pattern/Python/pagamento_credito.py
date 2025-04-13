from pagamento_strategy import PagamentoStrategy


class PagamentoCredito(PagamentoStrategy):
    def pagar(self, valor):
        acrescimo = valor*0.10
        valorComAcrescimo = valor + acrescimo
        print(f"Pagamento de R${valorComAcrescimo} em cartão de crédito realizado com sucesso!")
        print(f"Valor do acréscimo do crédito R${acrescimo}")