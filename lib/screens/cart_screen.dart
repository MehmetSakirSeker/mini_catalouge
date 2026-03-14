import 'package:flutter/material.dart';
import '../globals.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: const BackButton(),
      ),
      // Eğer sepet boşsa boş mesajı göster, doluysa listele
      body: cartItems.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text("Your cart is empty", style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: const Icon(Icons.devices_other),
            title: Text(item.name),
            subtitle: Text("\$${item.price}"),
            // Silme Butonu
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  cartItems.removeAt(index); // Listeden çıkar ve UI'ı güncelle
                });
              },
            ),
          );
        },
      ),
      // Sepet boşsa Checkout butonu gizlenir
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Satın alma işlemi başlatıldı.")));
          },
          child: const Text("Checkout", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}