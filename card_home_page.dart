// lib/pages/cart_grid_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/widgets/product_card.dart';
import 'cart_summary_page.dart'; // Import halaman ringkasan

class CartGridPage extends StatelessWidget {
  const CartGridPage({super.key});

  final List<ProductModel> dummyProducts = const [
    ProductModel(id: '1', name: 'Laptop Gaming High End', price: 15000000, image: 'img_url_1'),
    ProductModel(id: '2', name: 'Smartphone Mid Range', price: 8000000, image: 'img_url_2'),
    ProductModel(id: '3', name: 'Keyboard Mekanik RGB', price: 1200000, image: 'img_url_3'),
    ProductModel(id: '4', name: 'Mouse Wireless Ergonomic', price: 400000, image: 'img_url_4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTB Tech - Daftar Produk'),
        actions: [
          // Tombol navigasi ke CartSummaryPage
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartSummaryPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7, 
        ),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: dummyProducts[index]);
        },
      ),
    );
  }
}
