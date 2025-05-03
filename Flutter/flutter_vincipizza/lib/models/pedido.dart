import 'package:flutter_vincipizza/models/pedido_item.dart';

class Pedido {
  List<PedidoItem>? itens;
  String? enderecoCEP;
  String? enderecoLogradouro;
  String? enderecoNumero;
  String? enderecoBairro;

  Pedido({
    this.itens,
    this.enderecoCEP,
    this.enderecoLogradouro,
    this.enderecoNumero,
    this.enderecoBairro,
  });
}
