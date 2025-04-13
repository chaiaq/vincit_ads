using FaculdadeVincit.DesignPattern.StrategyPattern;

var sacola = new SacolaDeCompras();

sacola.Pagamento = new PagamentoCheque();
sacola.RealizarPagamento(1800);
System.Console.WriteLine();

sacola.Pagamento = new PagamentoPix();
sacola.RealizarPagamento(1800);
System.Console.WriteLine();

sacola.Pagamento = new PagamentoComCartaoCredito();
sacola.RealizarPagamento(1800);
System.Console.WriteLine();