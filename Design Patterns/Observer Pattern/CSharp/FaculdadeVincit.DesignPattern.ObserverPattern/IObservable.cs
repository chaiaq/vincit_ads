using System.Data;

namespace FaculdadeVincit.DesignPattern.ObserverPattern;

public interface IObservable<TValue>
{
    void Update(TValue valor);
}
