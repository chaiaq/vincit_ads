// Tarefa:
// Construir um if que verificar se o aluno é maior de idade:
/*
string nome;
int anoAtual, anoNascimento, idade;

anoAtual = 2024;

Console.WriteLine("Digite o nome do aluno:");
nome = Console.ReadLine();

Console.WriteLine("Qual o ano do seu nascimento? (XXXX)");
anoNascimento = int.Parse(Console.ReadLine());

idade = anoAtual - anoNascimento;

if (idade >= 18) {
    Console.WriteLine(nome + " é maior de idade");
} else {
    Console.WriteLine(nome + " tem menos que 18 anos");
}
*/


// Codigo da aula:
// Sistema de saude:
int febre, dorNoCorpo, dorDeCabeca;

Console.WriteLine("Tem febre?");
Console.WriteLine("1-SIM / 2-NAO");
febre = int.Parse(Console.ReadLine());

if (febre == 1)
{
    Console.WriteLine("Tem dor no corpo?");
    Console.WriteLine("1-SIM / 2-NAO");
    dorNoCorpo = int.Parse(Console.ReadLine());

    if (dorNoCorpo == 1)
    {
        Console.WriteLine("Voce tem sintomas de dengue.");
    }

}
else
{
    Console.WriteLine("Tem dor de cabeça?");
    Console.WriteLine("1-SIM / 2-NAO");
    dorDeCabeca = int.Parse(Console.ReadLine());

    if (dorDeCabeca == 1)
    {
        Console.WriteLine("Tome um cafe!");
    }
}

