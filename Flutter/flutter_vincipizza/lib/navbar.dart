import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // LOGO
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // CONTEUDO
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 52, 0, 0),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    leading: Icon(Icons.local_pizza, color: Colors.white),
                    title: Text(
                      "Cardápio",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/contato");
                    },
                    leading: Icon(Icons.contacts_rounded, color: Colors.white),
                    title: Text(
                      "Contato",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SAIR
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 52, 0, 0),
              ),
              child: ListTile(
                onTap: () {
                  SystemNavigator.pop();
                },
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                title: Text(
                  "Sair",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
