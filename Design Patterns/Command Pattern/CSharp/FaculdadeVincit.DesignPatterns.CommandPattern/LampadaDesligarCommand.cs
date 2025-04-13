namespace FaculdadeVincit.DesignPatterns.CommandPattern;

public class LampadaDesligarCommand : ICommand
{
    public Lampada lampada { get; private set; }

    public LampadaDesligarCommand(Lampada lampada)
    {
        this.lampada = lampada;
    }

    public void Executar() => lampada.desligar();

    public void Desfazer() => lampada.ligar();
}
