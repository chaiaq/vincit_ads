// CLASSE PARA CADASTRAR OS VEÍCULOS
class Veiculo {
  String? fabricante;
  String? modelo;
  String? anoFabricacao;
  String? cor;
  String? placa;

  //Construtor:
  Veiculo({
    required this.fabricante,
    required this.modelo,
    required this.anoFabricacao,
    required this.cor,
    required this.placa,
  });
}

// EXPLICAÇÕES:
// A "?" significa que os atributos podem ser 'null', então eles não precisam ter um valor definido, mas precisam ter algo
// O 'required' diz que essa informação é obrigatória, mas não precisa ser o usuário a preencher, nesse caso o sistema irá preencher como 'null'
