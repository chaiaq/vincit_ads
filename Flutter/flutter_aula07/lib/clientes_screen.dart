import 'package:flutter/material.dart';
import 'package:flutter_aula07/cliente.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

// ALTERAÇÕES SERÃO FEITAS APENAS NA CLASSE DE BAIXO:

class _ClientesScreenState extends State<ClientesScreen> {
  Cliente cliente = Cliente();
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "Cadastro do Cliente",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(label: Text("Nome")),
              ),
              TextField(
                controller: telefoneController,
                decoration: InputDecoration(label: Text("Telefone")),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(label: Text("E-mail")),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    String nome = nomeController.text;
                    String telefone = telefoneController.text;
                    String email = emailController.text;

                    cliente.nome = nome;
                    cliente.telefone = telefone;
                    cliente.email = email;

                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  DefaultTextStyle(
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text("Nome: ${cliente.nome}"),
                        Text("Telefone: ${cliente.telefone}"),
                        Text("Email: ${cliente.email}"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
