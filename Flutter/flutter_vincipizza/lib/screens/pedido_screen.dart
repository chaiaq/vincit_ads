import 'package:flutter/material.dart';
import 'package:flutter_vincipizza/navbar.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
              spacing: 3,
              children: [
                construtorItemPedido(),
                construtorItemPedido(),
                construtorItemPedido(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // FUNÇÃO PARA CONSTRUIR ENDEREÇO DE ENTREGA
  Widget construtorEndereco() {
    return Column(
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
          style: TextStyle(color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
            label: Text(
              "Bairro",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  // FUNÇÃO PARA CONSTRUIR CADA ITEM DO PEDIDO
  Widget construtorItemPedido() {
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
                        "assets/images/cardapio/pizza-margherita.jpg",
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
                          "Pizza Margherita",
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
                            "Tamanho: Família",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Quantidade: 2",
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
                    "R\$ 55,00",
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
}
