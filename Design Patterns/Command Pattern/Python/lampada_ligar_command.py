from command import Command
from lampada import Lampada

class LampadaLigarCommand(Command):
    def __init__(self, lampada: Lampada) -> None:
        self.lampada = lampada

    def executar(self):
        self.lampada.ligar()
    
    def desfazer(self):
        self.lampada.desligar()