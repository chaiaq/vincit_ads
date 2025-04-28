import 'package:flutter/material.dart';
import 'package:flutter_veiculos/cadastro_veiculo_screen.dart';
import 'package:flutter_veiculos/veiculo.dart';

class ListagemVeiculosScreen extends StatefulWidget {
  const ListagemVeiculosScreen({super.key});

  @override
  State<ListagemVeiculosScreen> createState() => _ListagemVeiculosScreenState();
}

class _ListagemVeiculosScreenState extends State<ListagemVeiculosScreen> {
  final List<Veiculo> veiculos = [
    Veiculo(
      fabricante: "Volks",
      modelo: "Gol",
      anoFabricacao: "2022",
      cor: "Branca",
      placa: "ABC-1234",
    ),
    Veiculo(
      fabricante: "GM",
      modelo: "Gol",
      anoFabricacao: "2022",
      cor: "Branca",
      placa: "ABC-1234",
    ),
    Veiculo(
      fabricante: "Ford",
      modelo: "Gol",
      anoFabricacao: "2022",
      cor: "Branca",
      placa: "ABC-1234",
    ),
    Veiculo(
      fabricante: "Fiat",
      modelo: "Gol",
      anoFabricacao: "2022",
      cor: "Branca",
      placa: "ABC-1234",
    ),
    Veiculo(
      fabricante: "Suzuki",
      modelo: "Gol",
      anoFabricacao: "2022",
      cor: "Branca",
      placa: "ABC-1234",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            "Listagem de veículos",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "listagem.add",
        //herotag funciona como o id do botão
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroVeiculoScreen()),
            //material page route é o que vai dar a seta pra retornar
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          return ListTile(title: criarLinha(index));
        },
      ),
    );
  }

  Widget criarLinha(int index) {
    Veiculo veiculo = veiculos.elementAt(index);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fabricante: ${veiculo.fabricante}"),
                    Text("Modelo: ${veiculo.modelo}"),
                    Text("Ano Fabricação: ${veiculo.anoFabricacao}"),
                    Text("Cor: ${veiculo.cor}"),
                    Text("Placa: ${veiculo.placa}"),
                  ],
                ),
              ),
              Expanded(
                //expanded para dividir os espaços ocupados em colunas
                flex: 2,
                child: FloatingActionButton(
                  heroTag: "excluir.${index}",
                  onPressed: () {
                    setState(() {
                      veiculos.remove(veiculo);
                    });
                  },
                  child: Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
