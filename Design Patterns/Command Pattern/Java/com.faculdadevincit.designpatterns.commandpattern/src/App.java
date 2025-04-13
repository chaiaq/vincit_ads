public class App {
    public static void main(String[] args) throws Exception {
        Lampada lampada = new Lampada();
        LampadaLigarCommand lampadaLigarCmd = new LampadaLigarCommand(lampada);
        LampadaDesligarCommand lampadaDesligarCmd = new LampadaDesligarCommand(lampada);

        ControleRemoto controle = new ControleRemoto();

        controle.setCommand(lampadaLigarCmd);
        controle.pressionarTecla();

        controle.setCommand(lampadaDesligarCmd);
        controle.pressionarTecla();

        controle.desfazerPressionar();

    }
}
