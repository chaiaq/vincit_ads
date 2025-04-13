public class LampadaLigarCommand implements ICommand {

    private Lampada lampada;

    public LampadaLigarCommand(Lampada lampada) {
        this.lampada = lampada;
    }

    @Override
    public void executar() {
        lampada.ligar();
    }

    @Override
    public void desfazer() {
        lampada.desligar();
    }

}
