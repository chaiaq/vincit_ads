import 'package:flutter/material.dart';
import 'package:flutter_vincipizza/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContatoScreen extends StatelessWidget {
  const ContatoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              String url = "http://facebook.com";
              await launchUrlString(url);
            },
            heroTag: "contato.facebook",
            backgroundColor: Colors.blueAccent,
            child: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
          ),
          FloatingActionButton(
            onPressed: () async {
              String url = "http://whatsapp.com";
              await launchUrlString(url);
            },
            heroTag: "contato.whatsapp",
            backgroundColor: const Color.fromARGB(255, 36, 228, 30),
            child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(220, 130, 0, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            "CONTATO",
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
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            // LOGO
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // INFORMAÇÕES
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        "VinciPizza Pizzaria",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "A pizzaria da faculdade Vincit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Endereço: Av. João Paulo Vieira Filho, 870",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Primeiro andar, Sala 11 a 14 - Centro",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Maringá, Paraná",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/maps.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
