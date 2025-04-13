public class App {
    public static void main(String[] args) throws Exception {
        SanduicheBuilder sanduicheBuilder = new SanduicheBuilder();
        Sanduiche sanduiche = sanduicheBuilder.setPao("Branco").setCarne("Ovelha").setQueijo("Prato").setTemSalada(true).Build();
        sanduiche.monstraInformacoesPedido();
    }
}
