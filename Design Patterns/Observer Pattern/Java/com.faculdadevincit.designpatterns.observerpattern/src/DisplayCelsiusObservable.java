public class DisplayCelsiusObservable implements IObservable<Double> {

    @Override
    public void update(Double value) {
       System.out.println("Temperatura em Celsius " + value + "ºC");
    }

}
