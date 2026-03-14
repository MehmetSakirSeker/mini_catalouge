import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../globals.dart'; // Global listeyi import ettik

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Görsel yerine renkli bir kutu ve ikon
            Container(height: 300, color: Colors.blueGrey[50], child: const Center(child: Icon(Icons.devices_other, size: 100, color: Colors.blueGrey))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(product.description),
                  const SizedBox(height: 20),
                  Text("Price: \$${product.price}", style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
          onPressed: () {
            // Ürünü global listeye ekle
            cartItems.add(product);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name} sepete eklendi!")));
          },
          child: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}