import 'package:flutter/material.dart';
import 'package:flutter_vincipizza/models/pedido.dart';
import 'package:flutter_vincipizza/models/pedido_item.dart';
import 'package:flutter_vincipizza/models/produto.dart';
import 'package:flutter_vincipizza/navbar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  Pedido? pedido;
  final oCcy = NumberFormat("#,##0.00", "pt_BR");

  // CONTROLLERS DO FORMULARIO DE ENDEREÇO
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final bairroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(220, 130, 0, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            "PEDIDO",
            style: TextStyle(
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: Navbar(),
      body: Container(
        padding: EdgeInsets.only(
          top:
              // CONSIDERA A APP BAR E COLOCA O CONTEÚDO ABAIXO DA ALTURA DELA
              MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              // DETALHES DO PEDIDO
              Expanded(flex: 4, child: construtorPedido()),
              // DADOS DO ENDEREÇO
              Expanded(flex: 3, child: construtorEndereco()),
              // BOTÃO FINALIZAR PEDIDO
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  onPressed: () {
                    enviarPedidoWhatsapp();
                  },
                  heroTag: "pedido.enviarpedido",
                  backgroundColor: const Color.fromARGB(255, 72, 0, 0),
                  child: Text(
                    "ENVIAR PEDIDO",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR O PEDIDO
  Widget construtorPedido() {
    double total =
        pedido!.itens!.map((item) => item.total).reduce((a, b) => a! + b!)!;
    return Column(
      spacing: 5,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Itens do Pedido",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Column(
                  spacing: 3,
                  children:
                      pedido!.itens!
                          .map((item) => construtorItemPedido(item))
                          .toList(),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: Text(
                    "R\$ ${oCcy.format(total)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // FUNÇÃO PARA CONSTRUIR ENDEREÇO DE ENTREGA
  Widget construtorEndereco() {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Endereço para Entrega",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // CAMPO CEP ***LINHA INTEIRA***
            TextField(
              controller: cepController,
              style: TextStyle(color: Colors.white, fontSize: 15),
              decoration: InputDecoration(
                label: Text(
                  "CEP",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            // UMA LINHA PARA ENDEREÇO E NÚMERO
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child:
                  // CAMPO ENDEREÇO
                  TextField(
                    controller: logradouroController,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      label: Text(
                        "Endereço",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:
                  // CAMPO NUMERO
                  TextField(
                    controller: numeroController,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      label: Text(
                        "Número",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // CAMPO BAIRRO ***LINHA INTEIRA***
            TextField(
              controller: bairroController,
              style: TextStyle(color: Colors.white, fontSize: 15),
              decoration: InputDecoration(
                label: Text(
                  "Bairro",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR CADA ITEM DO PEDIDO
  Widget construtorItemPedido(PedidoItem pedidoItem) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(150, 2, 2, 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            spacing: 3,
            children: [
              // IMAGEM
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/cardapio/${pedidoItem.produto!.imagem}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // DADOS DO PRODUTO
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          pedidoItem.produto!.descricao!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            pedidoItem.produtoTamanho!.descricao!,
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Quantidade: ${pedidoItem.quantidade}",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // VALOR DO PRODUTO
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "R\$ ${oCcy.format(pedidoItem.total)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FUNÇÃO PARA ENVIAR O PEDIDO VIA WHATSAPP
  Future enviarPedidoWhatsapp() async {
    String url = "https://wa.me/000000000?text=";
    String dadosPedido = "---------- NOVO PEDIDO ----------\n";

    pedido!.itens!.forEach((item) {
      Produto produto = item.produto!;
      dadosPedido +=
          " - ${item.quantidade}, ${item.produto!.descricao} - R\$ ${oCcy.format(item.total)}\n";
    });

    pedido!.enderecoCEP = cepController.text;
    pedido!.enderecoLogradouro = logradouroController.text;
    pedido!.enderecoNumero = numeroController.text;
    pedido!.enderecoBairro = bairroController.text;

    dadosPedido += "\n\n Endereço: \n";
    dadosPedido += "Logradouro: ${pedido!.enderecoLogradouro} \n";
    dadosPedido += "Número: ${pedido!.enderecoNumero} \n";
    dadosPedido += "Bairro: ${pedido!.enderecoBairro} \n";
    dadosPedido += "CEP: ${pedido!.enderecoCEP} \n";

    url = dadosPedido;
    await launchUrlString(url);
  }
}
