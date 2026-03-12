import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/cart_item.dart';

final cartProvider =
StateNotifierProvider<CartNotifier, List<CartItem>>(
      (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addProduct(CartItem item) {
    state = [...state, item];
  }

  void removeProduct(String productId) {
    state = state.where((e) => e.productId != productId).toList();
  }

  void clearCart() {
    state = [];
  }

  double get total =>
      state.fold(0, (sum, item) => sum + item.total);
}