import 'package:flutter/material.dart';
import 'package:fluuter_aula08/cliente.dart';

class ClienteFormScreen extends StatefulWidget {
  const ClienteFormScreen({super.key});

  @override
  State<ClienteFormScreen> createState() => _ClienteFormScreenState();
}

class _ClienteFormScreenState extends State<ClienteFormScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 230, 248),
        title: Center(
          child: Text(
            "Cadastro de Clientes",
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(label: Text("Nome:")),
              ),
              TextField(
                controller: sobrenomeController,
                decoration: InputDecoration(label: Text("Sobrenome:")),
              ),
              TextField(
                controller: telefoneController,
                decoration: InputDecoration(label: Text("Telefone:")),
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: "form.salvar",
                  onPressed: () {
                    String nome = nomeController.text;
                    String sobrenome = sobrenomeController.text;
                    String telefone = telefoneController.text;

                    Cliente novoCliente = Cliente(
                      nome: nome,
                      sobrenome: sobrenome,
                      telefone: telefone,
                    );

                    Navigator.pop(context, novoCliente);
                  },
                  child: Text("Salvar"),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: "form.cancelar",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
