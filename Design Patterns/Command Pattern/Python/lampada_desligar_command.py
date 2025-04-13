from command import Command
from lampada import Lampada

class LampadaDesligarCommand(Command):
    def __init__(self, lampada: Lampada) -> None:
        self.lampada = lampada

    def executar(self):
        self.lampada.desligar()
    
    def desfazer(self):
        self.lampada.ligar()