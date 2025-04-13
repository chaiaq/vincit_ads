from observable import Observable

class DisplayCelsiusObservables(Observable[float]):
    def update(self, value: float):
        print(f"Temperatura em Celsius: {value}ºC")