import 'package:flutter/material.dart';

// Importa o widget responsável por exibir cada item do carrinho
import 'package:loja_app/components/cart_item.dart';

// Importa o modelo do carrinho de compras
import 'package:loja_app/models/cart.dart';
import 'package:loja_app/models/order_list.dart';

// Importa o Provider para gerenciamento de estado
import 'package:provider/provider.dart';

// Página do carrinho de compras
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a instância do carrinho disponibilizada pelo Provider
    final Cart cart = Provider.of(context);

    // Converte os itens do carrinho (Map) em uma Lista
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),

      body: Column(
        children: [
          // Card que exibe o valor total da compra
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  // Texto "Total"
                  const Text('Total', style: TextStyle(fontSize: 20)),

                  const SizedBox(width: 10),

                  // Exibe o valor total do carrinho
                  Chip(
                    label: Text(
                      'R\$${cart.totalAmount.toStringAsFixed(2)}',

                      // Define a cor do texto
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  // Empurra o botão para a direita
                  const Spacer(),

                  // Botão para finalizar a compra
                  TextButton(
                    onPressed: () {
                      // Adiciona um novo pedido utilizando
                      // todos os itens do carrinho
                      Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(cart);

                      // Limpa o carrinho após a compra
                      cart.clear();
                    },

                    child: const Text('COMPRAR'),
                  ),
                ],
              ),
            ),
          ),

          // Expanded faz a lista ocupar o restante da tela
          Expanded(
            child: ListView.builder(
              // Quantidade de itens do carrinho
              itemCount: items.length,

              // Constrói cada item dinamicamente
              itemBuilder: (ctx, i) => CartItemWidget(items[i]),
            ),
          ),
        ],
      ),
    );
  }
}