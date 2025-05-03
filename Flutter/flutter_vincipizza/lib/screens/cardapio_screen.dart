import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vincipizza/models/pedido.dart';
import 'package:flutter_vincipizza/models/pedido_item.dart';
import 'package:flutter_vincipizza/models/produto.dart';
import 'package:flutter_vincipizza/models/produto_tamanho.dart';
import 'package:flutter_vincipizza/navbar.dart';
import 'package:flutter_vincipizza/screens/pedido_screen.dart';
import 'package:intl/intl.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  // VARIAVEL PARA CONTROLAR A VISIBILIDADE DO CARRINHO
  bool carrinhoVisivel = false;

  List<Produto> produtos = [];
  Pedido pedido = Pedido(itens: []);
  // VARIAVEL PARA FORMATAR O NÚMERO PARA PT-BR
  final oCcy = NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    // CHAMANDO OS PRODUTOS PARA O CARDÁPIO
    carregarProdutos().then((value) {
      setState(() {
        produtos = value;
      });
    });

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
          // ABA DE PIZZAS
          abaComScroll(
            Column(
              spacing: 10,
              children:
                  produtos
                      .where((produto) => produto.categoria == "pizza")
                      .map((produto) => construtorItemCardapio(produto))
                      .toList(),
            ),
          ),
          // ABA DE BEBIDAS
          abaComScroll(
            Column(
              spacing: 10,
              children:
                  produtos
                      .where((produto) => produto.categoria == "bebida")
                      .map((produto) => construtorItemCardapio(produto))
                      .toList(),
            ),
          ),
          // ABA DE SOBREMESAS
          abaComScroll(
            Column(
              spacing: 10,
              children:
                  produtos
                      .where((produto) => produto.categoria == "sobremesa")
                      .map((produto) => construtorItemCardapio(produto))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // FUNÇÃO PARA CONSTRUIR CADA ITEM DO CARDÁPIO
  Widget construtorItemCardapio(Produto produto) {
    return Container(
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
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cardapio/${produto.imagem}",
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
                    Text(
                      produto.descricao!,
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // DESCRIÇÃO
                    Text(
                      produto.ingredientes!,
                      style: TextStyle(fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
              onTap: () {
                var resultado = retonarTamanho(context, produto);
                resultado.then((tamanho) {
                  if (tamanho != null) {
                    var pedidoItem = PedidoItem(
                      produto: produto,
                      produtoTamanho: tamanho,
                      quantidade: 1,
                      total: tamanho.valor,
                    );
                    setState(() => pedido.itens!.add(pedidoItem));
                  }
                });
              },
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
      visible: pedido.itens!.isNotEmpty && carrinhoVisivel,
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
                    children:
                        pedido.itens!
                            .map(
                              (PedidoItem) =>
                                  construtorCarrinhoItem(PedidoItem),
                            )
                            .toList(),
                  ),
                ),
              ),
              // BOTÕES DO CARRINHO
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    botaoCarrinho("ADICIONAR MAIS ITENS", () {
                      setState(() => carrinhoVisivel = false);
                    }),
                    botaoCarrinho("FINALIZAR PEDIDO", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PedidoScreen(),
                          settings: RouteSettings(arguments: pedido),
                        ),
                      );
                    }),
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
    // FUNÇÃO QUE NÃO RETORNA NADA 'VOID'
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 77, 5, 0),
          textStyle: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
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
  Widget construtorCarrinhoItem(PedidoItem item) {
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
                          item.produto!.descricao!,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            item.produtoTamanho!.descricao!,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Quantidade: ${item.quantidade}",
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
                  onTap: () {
                    setState(() {
                      int quantidadePedido = item.quantidade! + 1;
                      double valor = item.produtoTamanho!.valor!;
                      double total = quantidadePedido * valor;

                      item.quantidade = quantidadePedido;
                      item.total = total;
                    });
                  },
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
                  onTap: () {
                    setState(() {
                      int quantidadePedido = item.quantidade! - 1;

                      if (quantidadePedido > 0) {
                        double valor = item.produtoTamanho!.valor!;
                        double total = quantidadePedido * valor;

                        item.quantidade = quantidadePedido;
                        item.total = total;
                      } else {
                        pedido.itens!.remove(item);

                        if (pedido.itens!.isEmpty) {
                          carrinhoVisivel = false;
                        }
                      }
                    });
                  },
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
      visible: pedido.itens!.isNotEmpty && !carrinhoVisivel,
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

  // FUNÇÃO PARA MOSTRAR AS OPÇÕES DE TAMANHO
  Future<ProdutoTamanho?> retonarTamanho(
    // O FUTURE RETORNA ALGO QUE ELE AINDA ESPERA QUE VAI ACONTECER
    // NESTE CASO A ESCOLHA DO TAMANHO PELO USUÁRIO
    BuildContext context,
    Produto produto,
  ) async {
    List<ProdutoTamanho> tamanhos = produto.tamanhos!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            produto.descricao!,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Escolha um tamanho:",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions:
              tamanhos.map((tamanho) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(tamanho),
                    child: Text(
                      "${tamanho.descricao} (R\$ ${oCcy.format(tamanho.valor)})",
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }

  // FUNÇÃO PARA CHAMAR OS PRODUTOS DO JSON
  Future<List<Produto>> carregarProdutos() async {
    String jsonString = await rootBundle.loadString(
      "assets/data/produtos.json",
    );

    // DICIONÁRIO PARA ORGANIZAR OS DADOS
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Produto> resultado =
        jsonList.map((json) => Produto.fromJson(json)).toList();

    return resultado;
  }
}
