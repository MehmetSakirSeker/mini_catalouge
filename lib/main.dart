import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/cart_screen.dart'; // Sepet ekranı eklendi

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatelessWidget {
  const MiniKatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}