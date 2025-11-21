import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Placeholder Gambar
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(child: Text(product.image, textAlign: TextAlign.center)),
              ),
            ),
            const SizedBox(height: 8.0),

            // Nama & Harga
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
            const SizedBox(height: 10.0),

            // Tombol Tambah ke Keranjang
            ElevatedButton.icon(
              onPressed: () {
                cartCubit.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} ditambahkan!')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart, size: 18),
              label: const Text('Tambah'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
