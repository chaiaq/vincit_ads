using FaculdadeVINCIT.DesignPatterns.BuilderPatterns;

var SanduicheBuilder = new SanduicheBuilder();
var sanduiche = SanduicheBuilder.SetPao("Americano")
                                .SetCarne("Frango")
                                .SetQueijo("Lanche")
                                .SetSalada(false)
                                .Build();

sanduiche.MostrarInformacoesPedido();