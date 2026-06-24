import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pos_session_provider.dart';

class CartPanel extends ConsumerWidget {
  const CartPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    if (session.cart.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: [
            Icon(Icons.shopping_cart_outlined, size: 48, color: const Color(0xFF9CA3AF).withOpacity(0.5)),
            const SizedBox(height: 12),
            const Text(
              'Cart is empty',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cart Items (${session.totalItems})',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6B7280),
                ),
              ),
              if (session.cart.isNotEmpty)
                GestureDetector(
                  onTap: () => notifier.clearCart(),
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: session.cart.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (_, i) {
            final item = session.cart[i];

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.inventory_2_rounded, size: 18, color: Color(0xFF10B981)),
                  ),
                  const SizedBox(width: 12),

                  // Name + unit
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                        Text(
                          '₹${item.price.toStringAsFixed(0)} / ${item.unit}',
                          style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                        ),
                      ],
                    ),
                  ),

                  // Qty stepper
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        _QtyBtn(
                          icon: Icons.remove,
                          onTap: () {
                            HapticFeedback.selectionClick();
                            notifier.decrement(item.productId);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            '${item.quantity}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ),
                        _QtyBtn(
                          icon: Icons.add,
                          isAdd: true,
                          onTap: () {
                            HapticFeedback.selectionClick();
                            notifier.increment(item.productId);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Subtotal & Remove
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹${item.total.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF10B981),
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => notifier.removeProduct(item.productId),
                        child: const Icon(Icons.delete_outline_rounded, size: 16, color: Color(0xFFEF4444)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isAdd;

  const _QtyBtn({required this.icon, required this.onTap, this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isAdd ? const Color(0xFF10B981).withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 15,
          color: isAdd ? const Color(0xFF10B981) : const Color(0xFF6B7280),
        ),
      ),
    );
  }
}