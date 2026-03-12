// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../providers/pos_session_provider.dart';
//
// class PaymentSelector extends ConsumerWidget {
//   const PaymentSelector({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     final notifier = ref.read(posSessionProvider.notifier);
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//
//         _button(ref, "Cash"),
//         _button(ref, "UPI"),
//         _button(ref, "Card"),
//         _button(ref, "Credit"),
//
//       ],
//     );
//   }
//
//   Widget _button(WidgetRef ref, String method) {
//
//     final notifier = ref.read(posSessionProvider.notifier);
//
//     return ElevatedButton(
//       onPressed: () {
//         notifier.setPaymentMethod(method);
//       },
//       child: Text(method),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/pos_session.dart';
import '../../providers/pos_session_provider.dart';

class PaymentSelector extends ConsumerWidget {
  const PaymentSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: PaymentMethod.values.map((method) {
        final isSelected = session.paymentMethod == method;
        return ElevatedButton(
          onPressed: () => notifier.setPaymentMethod(method),
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? const Color(0xFF10B981)
                : const Color(0xFFF3F4F6),
            foregroundColor: isSelected
                ? Colors.white
                : const Color(0xFF374151),
            elevation: 0,
          ),
          child: Text(method.label),
        );
      }).toList(),
    );
  }
}