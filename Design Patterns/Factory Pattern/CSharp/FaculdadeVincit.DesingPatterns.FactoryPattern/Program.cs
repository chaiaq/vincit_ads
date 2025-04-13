using FaculdadeVincit.DesingPatterns.FactoryPattern;

var transporte1 = TransporteFactory.CreateTransporte(TransporteEnum.AQUATICO);
var transporte2 = TransporteFactory.CreateTransporte(TransporteEnum.FERROVIARIO);
var transporte3 = TransporteFactory.CreateTransporte(TransporteEnum.RODOVIARIO);

transporte1.Entregar();
transporte2.Entregar();
transporte3.Entregar();