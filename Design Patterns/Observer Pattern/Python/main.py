import random
import time

from display_celsius_observable import DisplayCelsiusObservables
from display_farenheit_observable import DisplayFarenheitObservables
from estacao_meteorologica import EstacaoMeteorologica

estacao = EstacaoMeteorologica()
displayCelsius = DisplayCelsiusObservables()
displayFarenheit = DisplayFarenheitObservables()

estacao.add_observable(displayCelsius)
estacao.add_observable(displayFarenheit)

while True:
    temperatura = random.randint(18,40)
    print("Atualizando a temperatura...")
    estacao.set_temperatura(temperatura)
    time.sleep(2)