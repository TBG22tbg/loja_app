import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loja_app/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  // Controla se os detalhes do pedido estão visíveis
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
            ),
            // Botão para expandir/recolher os detalhes
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  // Inverte o valor da variável
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          // Exibe os detalhes somente se _expanded for true
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              // Define a altura dinamicamente
              // de acordo com a quantidade de produtos
              height: (widget.order.products.length * 24) + 10,
              child: ListView(
                // Percorre todos os produtos do pedido
                children: widget.order.products.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        //quantidade do Preço
                        '${product.quantity}x R\$ ${product.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}