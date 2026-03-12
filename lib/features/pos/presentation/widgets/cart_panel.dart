import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pos_session_provider.dart';

class CartPanel extends ConsumerWidget {
  const CartPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pos = ref.watch(posSessionProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    if (pos.cart.isEmpty) {
      return const Center(
        child: Text("Cart is empty"),
      );
    }

    return ListView.builder(
      itemCount: pos.cart.length,
      itemBuilder: (context, i) {

        final item = pos.cart[i];

        return ListTile(

          title: Text(item.name),

          subtitle: Text("x${item.quantity}"),

          trailing: Text("₹${item.total}"),

          onLongPress: () {
            notifier.removeProduct(item.productId);
          },

        );
      },
    );
  }
}