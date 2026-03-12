import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_store_ai/features/pos/presentation/widgets/cart_panel.dart';
import 'package:omni_store_ai/features/pos/presentation/widgets/customer_selector.dart';
import 'package:omni_store_ai/features/pos/presentation/widgets/product_grid.dart';

import '../providers/cart_provider.dart';

class AddTransactionScreen extends ConsumerWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Sale"),
      ),

      body: Column(
        children: [
          const CustomerSelector(),
          /// Product list
          const Expanded(
            child: ProductGrid(),
          ),

          /// Cart
          if (cart.isNotEmpty)
            const CartPanel(),
        ],
      ),
    );
  }
}