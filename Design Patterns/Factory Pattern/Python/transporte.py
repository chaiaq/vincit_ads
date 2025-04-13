from abc import ABC, abstractclassmethod

class Transporte(ABC):
    @abstractclassmethod
    def entregar(self):
        pass