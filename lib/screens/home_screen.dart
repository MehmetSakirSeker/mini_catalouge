import 'package:flutter/material.dart';
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // İnternet gerektirmeyen, görselsiz dummy veri
  final List<Map<String, dynamic>> dummyData = const [
    {"id": 1, "name": "AirPods Pro 2", "description": "Gürültü engelleme özellikli kulaklık.", "price": 249.0},
    {"id": 2, "name": "HomePod Mini", "description": "Zengin 360 derece ses deneyimi.", "price": 99.0},
    {"id": 3, "name": "MacBook Pro 14", "description": "M çipli güçlü dizüstü bilgisayar.", "price": 1999.0},
    {"id": 4, "name": "iPad Air", "description": "Hafif ve güçlü tablet deneyimi.", "price": 599.0},
  ];

  @override
  Widget build(BuildContext context) {
    List<Product> products = dummyData.map((e) => Product.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'), // Sepete git
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/detail', arguments: product),
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Görsel yerine cihaz ikonu
                        const Expanded(child: Center(child: Icon(Icons.devices_other, size: 50, color: Colors.blueGrey))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text("\$${product.price}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}