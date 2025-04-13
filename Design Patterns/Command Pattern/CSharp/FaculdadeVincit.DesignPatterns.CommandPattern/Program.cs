using FaculdadeVincit.DesignPatterns.CommandPattern;

var lampada = new Lampada();
var lampadaLigarCmd = new LampadaLigarCommand(lampada);
var lampadaDesligarCmd = new LampadaDesligarCommand(lampada);

var controle = new ControleRemoto();

controle.command = lampadaLigarCmd;
controle.PressionarBotao();

controle.command = lampadaDesligarCmd;
controle.PressionarBotao();

controle.DesfazerPressionar();

