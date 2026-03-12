import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/cart_item.dart';
import '../model/pos_session.dart';

class PosSessionNotifier extends Notifier<PosSession> {
  @override
  PosSession build() => const PosSession();

  // ── Customer ──
  void setCustomer({required String id, required String name}) {
    state = state.copyWith(customerId: id, customerName: name);
  }

  void clearCustomer() {
    state = state.copyWith(clearCustomer: true);
  }

  // ── Cart ──
  void addProduct(CartItem item) {
    final exists = state.cart.any((e) => e.productId == item.productId);
    if (exists) {
      state = state.copyWith(
        cart: state.cart.map((e) => e.productId == item.productId
            ? e.copyWith(quantity: e.quantity + 1)
            : e).toList(),
      );
    } else {
      state = state.copyWith(cart: [...state.cart, item]);
    }
  }

  void increment(String productId) {
    state = state.copyWith(
      cart: state.cart.map((e) => e.productId == productId
          ? e.copyWith(quantity: e.quantity + 1)
          : e).toList(),
    );
  }

  void decrement(String productId) {
    final item = state.cart.firstWhere((e) => e.productId == productId);
    if (item.quantity <= 1) {
      removeProduct(productId);
    } else {
      state = state.copyWith(
        cart: state.cart.map((e) => e.productId == productId
            ? e.copyWith(quantity: e.quantity - 1)
            : e).toList(),
      );
    }
  }

  void removeProduct(String productId) {
    state = state.copyWith(
      cart: state.cart.where((e) => e.productId != productId).toList(),
    );
  }

  void clearCart() {
    state = state.copyWith(cart: []);
  }

  // ── Payment ──
  void setPaymentMethod(PaymentMethod method) {
    state = state.copyWith(paymentMethod: method);
  }

  // ── Complete Sale ──
  Future<bool> completeSale() async {
    if (!state.canCompleteSale) return false;

    state = state.copyWith(status: PosStatus.processing);

    try {
      // Simulate processing — replace with real repository call
      await Future.delayed(const Duration(milliseconds: 1200));

      // TODO: call PosRepository.completeSale(...)
      // await _repo.completeSale(businessId, deviceId, state);

      state = state.copyWith(status: PosStatus.success);
      return true;
    } catch (e) {
      state = state.copyWith(
        status: PosStatus.error,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  void resetSale() => state = const PosSession();
}

final posSessionProvider =
NotifierProvider<PosSessionNotifier, PosSession>(PosSessionNotifier.new);

// ── Selected category filter ──
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

// ── Mock products (replace with Isar query later) ──
final mockProductsProvider = Provider((ref) => [
  {'id': 'p1', 'name': 'Milk',    'price': 30.0,  'unit': 'liter',  'category': 'Dairy'},
  {'id': 'p2', 'name': 'Curd',    'price': 25.0,  'unit': 'kg',     'category': 'Dairy'},
  {'id': 'p3', 'name': 'Paneer',  'price': 80.0,  'unit': 'kg',     'category': 'Dairy'},
  {'id': 'p4', 'name': 'Bread',   'price': 35.0,  'unit': 'pcs',    'category': 'Snacks'},
  {'id': 'p5', 'name': 'Biscuit', 'price': 20.0,  'unit': 'pcs',    'category': 'Snacks'},
  {'id': 'p6', 'name': 'Rice',    'price': 60.0,  'unit': 'kg',     'category': 'Rice'},
  {'id': 'p7', 'name': 'Sugar',   'price': 45.0,  'unit': 'kg',     'category': 'Rice'},
  {'id': 'p8', 'name': 'Tea',     'price': 120.0, 'unit': 'kg',     'category': 'Beverages'},
  {'id': 'p9', 'name': 'Coffee',  'price': 180.0, 'unit': 'kg',     'category': 'Beverages'},
  {'id': 'p10','name': 'Oil',     'price': 140.0, 'unit': 'liter',  'category': 'Oil'},
  {'id': 'p11','name': 'Ghee',    'price': 320.0, 'unit': 'kg',     'category': 'Oil'},
  {'id': 'p12','name': 'Flour',   'price': 55.0,  'unit': 'kg',     'category': 'Rice'},
]);

final filteredProductsProvider = Provider((ref) {
  final all = ref.watch(mockProductsProvider);
  final cat = ref.watch(selectedCategoryProvider);
  if (cat == null) return all;
  return all.where((p) => p['category'] == cat).toList();
});

final mockCategoriesProvider = Provider((ref) =>
['All', 'Dairy', 'Snacks', 'Rice', 'Beverages', 'Oil']);

// ── Mock customers ──
final mockCustomersProvider = Provider((ref) => [
  {'id': 'c1', 'name': 'Ramesh Kumar',  'phone': '9876543210', 'balance': 450.0},
  {'id': 'c2', 'name': 'Sunil Verma',   'phone': '9123456789', 'balance': 0.0},
  {'id': 'c3', 'name': 'Priya Sharma',  'phone': '8888888888', 'balance': 1200.0},
  {'id': 'c4', 'name': 'Amit Patel',    'phone': '9999999999', 'balance': 0.0},
  {'id': 'c5', 'name': 'Neha Singh',    'phone': '7777777777', 'balance': 230.0},
]);