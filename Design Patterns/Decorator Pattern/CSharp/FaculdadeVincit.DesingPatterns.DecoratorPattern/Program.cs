using FaculdadeVincit.DesingPatterns.DecoratorPattern;

ICafe cafe = new CafeSimples();
System.Console.WriteLine($"{cafe.Descricao} | Preço {cafe.Custo}");

cafe = new CafeAdicionalDeLeite(cafe);
System.Console.WriteLine($"{cafe.Descricao} | Preço {cafe.Custo}");

cafe = new CaféAdicionalDeAcucar(cafe);
System.Console.WriteLine($"{cafe.Descricao} | Preço {cafe.Custo}");