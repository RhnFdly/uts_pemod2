import 'package:flutter_bloc/flutter_bloc.dart';
import './models/product_model.dart';

// State yang akan di-emit. Berisi list item keranjang
typedef CartState = List<CartItemModel>;

class CartCubit extends Cubit<CartState> {
  CartCubit() : super([]);

  // Menambah produk ke keranjang
  void addToCart(ProductModel product) {
    final currentState = state;
    final itemIndex = currentState.indexWhere((item) => item.product.id == product.id);
    
    if (itemIndex >= 0) {
      // Jika produk sudah ada, tingkatkan kuantitas
      currentState[itemIndex].quantity++;
    } else {
      // Jika produk belum ada, tambahkan item baru
      currentState.add(CartItemModel(product: product));
    }

    // Emit state baru (menyalin list agar perubahan terdeteksi)
    emit(List.from(currentState));
  }

  // Method lainnya bisa ditambahkan di sini
  // seperti removeFromCart, clearCart, dll.
}
