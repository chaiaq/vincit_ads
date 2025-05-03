import 'package:flutter/material.dart';
import 'package:flutter_vincipizza/screens/cardapio_screen.dart';
import 'package:flutter_vincipizza/screens/contato_screen.dart';
import 'package:flutter_vincipizza/screens/pedido_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/contato",
      routes: {
        "/": (context) => CardapioScreen(),
        "/pedido": (context) => PedidoScreen(),
        "/contato": (context) => ContatoScreen(),
      },
    );
  }
}
