import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurant/models/shop.dart';
import 'package:sushirestaurant/pages/cart_page.dart';
import 'package:sushirestaurant/pages/intro_page.dart';
import 'package:sushirestaurant/pages/menu_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/menu_page': (context) => const MenuPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
