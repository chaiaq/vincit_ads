public class LampadaDesligarCommand implements ICommand {

    private Lampada lampada;

    public LampadaDesligarCommand(Lampada lampada) {
        this.lampada = lampada;
    }

    @Override
    public void executar() {
        lampada.desligar();
    }

    @Override
    public void desfazer() {
        lampada.ligar();
    }

}
