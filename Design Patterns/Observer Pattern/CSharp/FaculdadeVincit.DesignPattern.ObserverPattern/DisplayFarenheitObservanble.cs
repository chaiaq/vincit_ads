namespace FaculdadeVincit.DesignPattern.ObserverPattern;

public class DisplayFarenheitObservable : IObservable<double>
{
    public void Update(double valor)
    {
        var farenheit = (valor *9/5)+32;
        System.Console.WriteLine($"Temperatura em Farenheit {farenheit} ºF");
    }
}
