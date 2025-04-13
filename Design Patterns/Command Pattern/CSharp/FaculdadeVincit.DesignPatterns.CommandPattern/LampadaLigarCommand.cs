namespace FaculdadeVincit.DesignPatterns.CommandPattern;

public class LampadaLigarCommand : ICommand
{
    public Lampada lampada { get; private set; }

    public LampadaLigarCommand(Lampada lampada)
    {
        this.lampada = lampada;
    }

    public void Executar() => lampada.ligar();

    public void Desfazer() => lampada.desligar();
}
