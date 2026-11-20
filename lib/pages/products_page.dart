import 'package:flutter/material.dart';
import 'package:loja_app/components/app_drawer.dart';
import 'package:loja_app/components/product_item.dart';

import 'package:loja_app/models/product_list.dart';
import 'package:loja_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.productFrom);
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => Column(
            children: [ProductItem(products.items[i]), const Divider()],
          ),
        ),
      ),
    );
  }
}