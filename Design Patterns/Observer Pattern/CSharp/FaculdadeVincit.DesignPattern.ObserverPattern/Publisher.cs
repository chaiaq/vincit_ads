using System.Security.Cryptography.X509Certificates;

namespace FaculdadeVincit.DesignPattern.ObserverPattern;

public abstract class Publisher<TValue>
{
    public List<IObservable<TValue>> Observables {get; private set;}

    public Publisher()
    {
        Observables = new List<IObservable<TValue>>();

    }

    public void AddObservable(IObservable<TValue> observable) => Observables.Add(observable);

    public void RemoveObservable(IObservable<TValue> observable) => Observables.Remove(observable);

    protected void NotifyObservables(TValue valor) => Observables.ForEach(o => o.Update(valor));
}
