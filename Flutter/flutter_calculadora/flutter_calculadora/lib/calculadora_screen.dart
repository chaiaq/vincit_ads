import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

//EDIÇÃO A PARTIR DAQUI:

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  // CONTROLADORES:
  final valor1Controller = TextEditingController();
  final valor2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 120, 0, 142),
        title: Center(
          child: Text(
            "Calculadora",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Digite o primeiro número:", style: TextStyle(fontSize: 20)),
            TextField(
              controller: valor1Controller,
              // LIMITANDO A NÚMEROS:
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 30),
            Text("Digite o segundo número:", style: TextStyle(fontSize: 20)),
            TextField(
              controller: valor2Controller,
              // LIMITANDO A NÚMEROS:
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 50),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    double valor1 = double.parse(valor1Controller.text);
                    double valor2 = double.parse(valor2Controller.text);

                    double resultado = valor1 + valor2;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            resultado.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("+"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    double valor1 = double.parse(valor1Controller.text);
                    double valor2 = double.parse(valor2Controller.text);

                    double resultado = valor1 - valor2;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            resultado.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("-"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    double valor1 = double.parse(valor1Controller.text);
                    double valor2 = double.parse(valor2Controller.text);

                    double resultado = valor1 * valor2;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            resultado.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("*"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    double valor1 = double.parse(valor1Controller.text);
                    double valor2 = double.parse(valor2Controller.text);

                    if (valor2 != 0) {
                      double resultado = valor1 / valor2;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              resultado.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "Impossível divisão por 0",
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Text("/"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
