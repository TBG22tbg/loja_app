//Criando as opções com filtro (enum)

import 'package:flutter/material.dart' hide Badge;
import 'package:loja_app/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:loja_app/components/app_drawer.dart';
import 'package:loja_app/components/badge.dart';
import 'package:loja_app/components/product_grid.dart';
import 'package:loja_app/models/cart.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //criando a barra superior
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            //mostra uma opção quando o usuário clica no icone
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value:
                    FilterOptions.favorite, //filtro para mostrar os favoritos
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            //é o widget que acompanha as mudanças de um objeto fornecido pelo provider (Cart)
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: const Icon(Icons.shopping_cart), //icone do carrinho
            ),
            //o  builder receberá três parametros
            builder: (ctx, cart, child) =>
                Badge(value: cart.itemsCount.toString(), child: child!),
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}