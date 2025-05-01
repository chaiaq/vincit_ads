import 'package:flutter/material.dart';
import 'package:fluuter_aula08/cliente.dart';
import 'package:fluuter_aula08/cliente_form_screen.dart';

class ClienteListaScreen extends StatefulWidget {
  const ClienteListaScreen({super.key});

  @override
  State<ClienteListaScreen> createState() => _ClienteListaScreenState();
}

class _ClienteListaScreenState extends State<ClienteListaScreen> {
  List<Cliente> clientes = [
    Cliente(nome: "José", sobrenome: "Silva", telefone: "44 98568 7414"),
    Cliente(nome: "Maria", sobrenome: "João", telefone: "44 96325 7414"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 230, 248),
        title: Center(
          child: Text(
            "Lista de Clientes",
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "lista.add",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClienteFormScreen()),
          ).then((value) {
            if (value != null) {
              Cliente clienteAdicionado = value;

              setState(() {
                clientes.add(clienteAdicionado);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(title: retornarElementoCliente(index));
        },
      ),
    );
  }

  Widget retornarElementoCliente(int index) {
    Cliente cliente = clientes[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.pinkAccent, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text("Nome: ${cliente.nome} ${cliente.sobrenome}"),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          clientes.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
              Text("Telefone: ${cliente.telefone}"),
            ],
          ),
        ),
      ),
    );
  }
}
