import 'package:flutter/material.dart';

class Aula06Screen extends StatelessWidget {
  const Aula06Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aula 06")),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  color: Colors.yellow,
                  // Media Query of (context) -> adequação com base no contexto da tela principal, a tela inteira (considerando APP BAR)
                  // Dividido por 2 para que utilize apenas metade do valor
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    children: [
                      // o Expanded separa as colunas e define os tamanhos
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Texto 0000001"),
                              Text("Texto 00063443"),
                              Text("Texto 02674225"),
                              Text("Texto 12357780-1"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(label: Text("Nome")),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                label: Text("Telefone"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.orange,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Text("Exemplo"),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Text("Página Inicial"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
