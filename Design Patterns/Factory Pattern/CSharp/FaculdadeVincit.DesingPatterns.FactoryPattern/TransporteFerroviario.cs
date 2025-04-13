namespace FaculdadeVincit.DesingPatterns.FactoryPattern;

public class TransporteFerroviario : ITransporte
{
    public void Entregar()
    {
        System.Console.WriteLine("Entregando via ferrovia!");
    }

}
