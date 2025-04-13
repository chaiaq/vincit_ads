from controle_remoto import ControleRemoto
from lampada import Lampada
from lampada_desligar_command import LampadaDesligarCommand
from lampada_ligar_command import LampadaLigarCommand


lampada = Lampada()
lampadaLigarCmd = LampadaLigarCommand(lampada)
lampadaDesligarCmd = LampadaDesligarCommand(lampada)

controle = ControleRemoto()

controle.command = lampadaLigarCmd
controle.pressionar_botao()

controle.command = lampadaDesligarCmd
controle.pressionar_botao()

controle.desfazer_pressionar()