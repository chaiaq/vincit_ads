namespace FaculdadeVincit.DesignPattern.ObserverPattern;

public class DisplayCelsiusObservable : IObservable<double>
{
    public void Update(double valor)
    {
        System.Console.WriteLine($"Temperatura em Celsius {valor} ºC");
    }
}
