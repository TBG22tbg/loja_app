import 'package:flutter/material.dart';
import 'package:loja_app/pages/cart_page.dart';
import 'package:loja_app/pages/orders_page.dart';
import 'package:loja_app/pages/product_detail_page.dart';
import 'package:loja_app/pages/lib/pages/product_form_page.dart';
import 'package:loja_app/pages/products_overview_page.dart';
import 'package:loja_app/pages/products_page.dart';
import 'package:loja_app/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:loja_app/models/product_list.dart';
import 'package:loja_app/models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Catálogo de produtos
        ChangeNotifierProvider(create: (_) => ProductList()),
        //Produtos selecionados para a compra
        ChangeNotifierProvider(create: (_) => Cart()),
        //Pedidos realizados
        //ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Minha loja',
        // O tema de core no main para definição do projeto. Poderia ser construido como um componente a parte.
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        //home: const Produto(),
        // Rotas de todas as página que forem construida no projeto.
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productFrom: (ctx) => const ProductFormPage(),
          //aa
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}