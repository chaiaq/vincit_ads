namespace FaculdadeVincit.DesingPatterns.FactoryPattern;

public class TransporteRodoviario : ITransporte
{
    public void Entregar()
    {
        System.Console.WriteLine("Entregando via rodovia!");
    }

}
