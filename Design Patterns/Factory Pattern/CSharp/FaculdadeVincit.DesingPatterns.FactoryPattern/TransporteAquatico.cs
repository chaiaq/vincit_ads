namespace FaculdadeVincit.DesingPatterns.FactoryPattern;

public class TransporteAquatico : ITransporte
{
    public void Entregar()
    {
        System.Console.WriteLine("Entregando via mar!");
    }

}
