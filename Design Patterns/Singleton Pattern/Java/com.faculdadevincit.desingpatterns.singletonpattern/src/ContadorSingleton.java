public class ContadorSingleton {
    private int valor = 0;
    private static ContadorSingleton instance;

    public static ContadorSingleton getInstance() {
        if (instance == null) {
            instance = new ContadorSingleton();
        }
        return instance;
    }

    public ContadorSingleton() {
        super();
    }

    public int getValor() {
        return valor;
    }

    public void incrementar() {
        valor++;
    }
}
