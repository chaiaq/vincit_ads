
from ProcessadorPedidos import ProcessadorPedidos
from SistemaEnvio import SistemaEnvios
from SistemaPagamentos import SistemaPagamentos



class LojaFacade:
    def __init__(self):
        self.processador_pedidos = ProcessadorPedidos()
        self.sistema_pagamento = SistemaPagamentos()
        self.sistema_envio = SistemaEnvios()

    def fazer_pedido(self, item, valor):
        self.processador_pedidos.criar_pedido(item)
        self.sistema_pagamento.processar_pagamento(valor)
        self.sistema_envio.enviar_pedido(item)

        print("Pedido realizado com sucesso!")
        