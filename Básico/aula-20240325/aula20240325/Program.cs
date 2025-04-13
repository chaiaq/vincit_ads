/*
// Código da aula:
// Tenho dinheiro para uma casquinha do Mc?
float mesada;
Console.WriteLine("Quanto você ganha?");
mesada = float.Parse(Console.ReadLine());

if (mesada < 14.90f) {
    Console.WriteLine("Você não tem dinheiro para o McFlurry");
} else {
    Console.WriteLine("Baunilha, chocolate ou misto?");
}
*/

/*
// laço for
for (int valor = 1; valor <= 10; valor++) {
    Console.WriteLine(valor);
}
*/

int sequencia, multiplicador;

Console.WriteLine("A tabuada de qual número você quer? ");
multiplicador = int.Parse(Console.ReadLine());

for (sequencia = 1; sequencia <= 10; sequencia++) {
    Console.WriteLine(sequencia + "*" + multiplicador + " = " + (sequencia*multiplicador));
}