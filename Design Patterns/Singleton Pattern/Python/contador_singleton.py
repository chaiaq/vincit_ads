class ContadorSingleton:
    _valor = 0
    _instance = None

    @property
    def valor(self):
        return self._valor

    def incrementar(self):
        self._valor += 1

    def __new__(self):
        if self._instance is None:
            self._instance = super(ContadorSingleton, self).__new__(self)
        return self._instance

        
