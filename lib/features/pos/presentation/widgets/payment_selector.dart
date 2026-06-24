import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/pos_session.dart';
import '../../providers/pos_session_provider.dart';

class PaymentSelector extends ConsumerWidget {
  const PaymentSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: PaymentMethod.values.map((method) {
            final isSelected = session.paymentMethod == method;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: method != PaymentMethod.values.last ? 8 : 0),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    notifier.setPaymentMethod(method);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    height: 52,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (method == PaymentMethod.credit ? const Color(0xFFF59E0B) : const Color(0xFF10B981))
                          : const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? (method == PaymentMethod.credit ? const Color(0xFFF59E0B) : const Color(0xFF10B981))
                            : const Color(0xFFE5E7EB),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(method.emoji, style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 2),
                        Text(
                          method.label,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}