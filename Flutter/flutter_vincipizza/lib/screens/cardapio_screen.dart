import 'package:flutter/material.dart';
import 'package:flutter_vincipizza/navbar.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  // VARIAVEL PARA CONTROLAR A VISIBILIDADE DO CARRINHO
  bool carrinhoVisivel = false;

  @override
  Widget build(BuildContext context) {
    // TAB CONTROLLER CONTROLA O ESTADO DAS ABAS
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(220, 77, 0, 0),
          iconTheme: IconThemeData(color: Colors.white),
          title: Center(
            child: Text(
              "CARDÁPIO",
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              // CADA TAB É UMA ABA DA PÁGINA DE CARDÁPIO
              Tab(icon: Icon(Icons.local_pizza, color: Colors.white)),
              Tab(icon: Icon(Icons.local_drink, color: Colors.white)),
              Tab(icon: Icon(Icons.icecream, color: Colors.white)),
            ],
          ),
        ),
        drawer: Navbar(),
        body: Stack(
          // STACK SERVE PARA EMPILHAR ELEMENTOS
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.only(
                top:
                    // CONSIDERA A APP BAR E COLOCA O CONTEÚDO ABAIXO DA ALTURA DELA
                    MediaQuery.of(context).padding.top +
                    kToolbarHeight +
                    kTextTabBarHeight,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: construtorCardapio(),
            ),
            construtorCarrinho(),
            previewCarrinho(),
          ],
        ),
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR O CARDÁPIO
  Widget construtorCardapio() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TabBarView(
        children: [
          abaComScroll(
            // ABA DE PIZZAS
            Column(
              spacing: 10,
              children: [
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
                construtorItemCardapio(),
              ],
            ),
          ),
          // ABA DE BEBIDAS
          Column(),
          // ABA DE SOBREMESAS
          Column(),
        ],
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR CADA ITEM DO CARDÁPIO
  Widget construtorItemCardapio() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(130, 0, 0, 0),
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // *** IMAGEM ***
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cardapio/pizza-margherita.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // *** DESCRIÇÃO ***
          Expanded(
            flex: 5,
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOME DO ITEM
                    Text("Pizza Margherita", style: TextStyle(fontSize: 18)),
                    // DESCRIÇÃO
                    Text(
                      "Molho de tomate, mussarela, manjericão fresco, azeite de oliva.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // *** ICONE ***
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // personalizado: FUNÇÃO PARA ATIVAR O SCROLL NAS TELAS DO CARDÁPIO
  Widget abaComScroll(Widget child) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: child,
    );
  }

  // FUNÇÃO PARA CONSTRUIR O CARRINHO DE COMPRAS
  Widget construtorCarrinho() {
    // VISIBILITY CONTROLA QUANDO O CARRINHO É VISÍVEL
    return Visibility(
      // LIGA O VISIBILITY A VARIAVEL DE CONTROLE
      visible: carrinhoVisivel,
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              // ITENS DO CARRINHO
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      construtorCarrinhoItem(),
                      construtorCarrinhoItem(),
                      construtorCarrinhoItem(),
                      construtorCarrinhoItem(),
                      construtorCarrinhoItem(),
                    ],
                  ),
                ),
              ),
              // BOTÕES DO CARRINHO
              Expanded(
                flex: 1,
                child: Column(
                  spacing: 5,
                  children: [
                    botaoCarrinho(
                      "ADICIONAR MAIS ITENS",
                      () {},
                      heroTag: "cardapio.adicionaritens",
                    ),
                    botaoCarrinho(
                      "FINALIZAR PEDIDO",
                      () {},
                      heroTag: "cardapio.finalizar",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // personalizado: FUNÇÃO PARA PERSONALIZAR OS BOTÕES
  Widget botaoCarrinho(
    String texto,
    VoidCallback onPressed, {
    // FUNÇÃO QUE NÃO RETORNA NADA 'VOID'
    String? heroTag,
  }) {
    return SizedBox(
      width: double.infinity,
      child: FloatingActionButton(
        onPressed: onPressed,
        heroTag: heroTag,
        backgroundColor: const Color.fromARGB(255, 72, 0, 0),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR OS ITENS DO CARRINHO
  Widget construtorCarrinhoItem() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(50, 0, 0, 0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            // ITEM DO CARRINHO
            children: [
              // DESCRIÇÃO
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pizza Margherita",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Tamanho: Família",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Quantidade: 2",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // BOTÃO DE ADICIONAR
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreenAccent,
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
              // BOTÃO DE REMOVER
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR O PREVIEW DO CARRINHO
  Widget previewCarrinho() {
    return Visibility(
      visible: !carrinhoVisivel,
      child: GestureDetector(
        onTap: () {
          setState(() => carrinhoVisivel = true);
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Center(
            child: Text(
              "FINALIZAR PEDIDO",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
