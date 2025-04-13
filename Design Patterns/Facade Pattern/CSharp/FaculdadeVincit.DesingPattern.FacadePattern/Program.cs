using FaculdadeVincit.DesingPattern.FacadePattern;

var loja = new LojaFacade();

loja.FazerPedido("Laptop", 2999.90m);
loja.FazerPedido("Smartphone", 5999.00m);