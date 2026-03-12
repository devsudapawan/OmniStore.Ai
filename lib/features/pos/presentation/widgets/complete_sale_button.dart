import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pos_session_provider.dart';

class CompleteSaleButton extends ConsumerWidget {
  const CompleteSaleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pos = ref.watch(posSessionProvider);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(

          onPressed: pos.cart.isEmpty
              ? null
              : () {

            /// Next step → call POS engine
          },

          child: Text("Complete Sale  ₹${pos.total}"),
        ),
      ),
    );
  }
}