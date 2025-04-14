import 'package:flutter/material.dart';

class Aula05Screen extends StatelessWidget {
  Aula05Screen({super.key});

  int valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text("Aula 05", style: TextStyle(color: Colors.brown)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                label: Text(
                  "Nome do Aluno",
                  style: TextStyle(color: Colors.amber, fontSize: 16),
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text(
                  "Análise e Desenvolvimento de Sistemas",
                  style: TextStyle(color: Colors.brown, fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                const Text("Disciplinas", style: TextStyle(fontSize: 10)),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(value: 1, child: Text("Programação")),
                    DropdownMenuItem(value: 2, child: Text("Mobile")),
                    DropdownMenuItem(value: 3, child: Text("Dados")),
                    DropdownMenuItem(value: 4, child: Text("Scrum")),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
            RadioListTile(
              title: const Text("Manhã"),
              value: 1,
              groupValue: valor,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: const Text("Tarde"),
              value: 2,
              groupValue: valor,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: const Text("Noite"),
              value: 3,
              groupValue: valor,
              onChanged: (value) {},
            ),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text("Salvar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//PRIMEIRO TEXTO:
    /*return const Column(
      //usar coluna para organizar os elementos
      children: [
        Text(
          "App da Chai",
          style: TextStyle(color: Colors.amber, fontSize: 50),
        ),
        Text("Outro elemento", style: TextStyle(color: Colors.blue)),
      ],
    );*/
