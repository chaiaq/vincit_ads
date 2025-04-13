// Tarefa da aula:
// Receber os dados do usuário
// Tratar os dados recebidos



// Variáveis:
string nome;
int notaProva, notaTrabalho;
float media;


// Executando:
Console.WriteLine("Digite o nome completo do aluno:");
nome = Console.ReadLine();

Console.WriteLine("Digite a nota da prova (0 a 10):");
notaProva = int.Parse(Console.ReadLine());

Console.WriteLine("Digite a nota do trabalho (0 a 10):");
notaTrabalho = int.Parse(Console.ReadLine());

media = (notaProva + notaTrabalho) / 2;
Console.WriteLine("A média do aluno é " + media);

if (media > 7) {
    Console.WriteLine("Aluno aprovado!");
} else {
    Console.WriteLine("Aluno reprovado!");
}


// código da aula:
/*
int anoNascimento;
float salario;
char letra;
string nome;

float valor1, valor2, resultado;

System.Console.WriteLine("Digite o primeiro valor:");
valor1 = float.Parse(Console.ReadLine());
System.Console.WriteLine("Digite o segundo valor:");
valor2 = float.Parse(Console.ReadLine());

resultado = valor1 + valor2;
System.Console.WriteLine(resultado);

resultado = valor1 - valor2;
System.Console.WriteLine(resultado);

resultado = valor1 * valor2;
System.Console.WriteLine(resultado);

resultado = valor1 / valor2;
System.Console.WriteLine(resultado);
*/

// Para a próxima aula:
// Estrutura condicional 'if' perguntar se a pessoa é maior de idade;