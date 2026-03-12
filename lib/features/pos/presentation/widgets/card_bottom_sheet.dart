import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business_setup/providers/business_setup_provider.dart'  hide PaymentMethod;
import '../../model/pos_session.dart' ;
import '../../providers/pos_session_provider.dart';

/// -------------------------------------------------------
///  CartBottomSheet
///  Full-height bottom sheet with:
///  - Cart item list
///  - Payment method selector
///  - Complete sale button
/// -------------------------------------------------------
class CartBottomSheet extends ConsumerStatefulWidget {
  const CartBottomSheet({super.key});

  @override
  ConsumerState<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends ConsumerState<CartBottomSheet> {
  bool _saleComplete = false;

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(posSessionProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: _saleComplete
          ? _buildSuccessState(context, session)
          : Column(
        children: [
          // ── Handle ──
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),

          // ── Header ──
          _buildHeader(session),

          // ── Cart Items ──
          Expanded(child: _buildCartList(session)),

          // ── Payment + Complete ──
          _buildBottomSection(context, session),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader(PosSession session) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.shopping_cart_rounded,
                  size: 18, color: Color(0xFF10B981)),
              const SizedBox(width: 8),
              Text(
                'Cart  (${session.totalItems} items)',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
          if (session.cart.isNotEmpty)
            GestureDetector(
              onTap: () {
                ref.read(posSessionProvider.notifier).clearCart();
                Navigator.pop(context);
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Clear all',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  CART LIST
  // ─────────────────────────────────────────
  Widget _buildCartList(PosSession session) {
    if (session.cart.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,
                size: 48, color: Color(0xFFD1D5DB)),
            SizedBox(height: 12),
            Text('Cart is empty',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: session.cart.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final item = session.cart[i];
        final notifier = ref.read(posSessionProvider.notifier);

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
                child: const Icon(Icons.inventory_2_rounded,
                    size: 18, color: Color(0xFF10B981)),
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
                      '₹${item.price.toStringAsFixed(0)} × ${item.quantity} ${item.unit}',
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF9CA3AF)),
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
                      onTap: () {
                        HapticFeedback.selectionClick();
                        notifier.increment(item.productId);
                      },
                      isAdd: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // Subtotal
              Text(
                '₹${item.total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF10B981),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────
  //  BOTTOM SECTION
  // ─────────────────────────────────────────
  Widget _buildBottomSection(BuildContext context, PosSession session) {
    final notifier = ref.read(posSessionProvider.notifier);

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Payment methods ──
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: PaymentMethod.values.map((method) {
              final isSelected = session.paymentMethod == method;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: method != PaymentMethod.values.last ? 8 : 0),
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      notifier.setPaymentMethod(method);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 160),
                      height: 48,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (method == PaymentMethod.credit
                            ? const Color(0xFFF59E0B)
                            : const Color(0xFF10B981))
                            : const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? (method == PaymentMethod.credit
                              ? const Color(0xFFF59E0B)
                              : const Color(0xFF10B981))
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(method.emoji,
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(height: 1),
                          Text(
                            method.label,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF6B7280),
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

          const SizedBox(height: 16),

          // ── Total + Complete Sale ──
          Row(
            children: [
              // Total
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total',
                      style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w500)),
                  Text(
                    '₹${session.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Complete button
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: session.canCompleteSale
                        ? () => _completeSale(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: session.canCompleteSale
                          ? (session.isCredit
                          ? const Color(0xFFF59E0B)
                          : const Color(0xFF10B981))
                          : const Color(0xFFE5E7EB),
                      foregroundColor: Colors.white,
                      elevation: session.canCompleteSale ? 2 : 0,
                      shadowColor: const Color(0xFF10B981).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: session.status == PosStatus.processing
                        ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                          strokeWidth: 2.5, color: Colors.white),
                    )
                        : Text(
                      session.paymentMethod == null
                          ? 'Select Payment'
                          : session.isCredit
                          ? 'Record as Credit'
                          : 'Complete Sale',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: session.canCompleteSale
                            ? Colors.white
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  COMPLETE SALE
  // ─────────────────────────────────────────
  Future<void> _completeSale(BuildContext context) async {
    HapticFeedback.mediumImpact();
    final success =
    await ref.read(posSessionProvider.notifier).completeSale();
    if (success && mounted) {
      setState(() => _saleComplete = true);
    }
  }

  // ─────────────────────────────────────────
  //  SUCCESS STATE
  // ─────────────────────────────────────────
  Widget _buildSuccessState(BuildContext context, PosSession session) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Success icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_circle_rounded,
                size: 44, color: Color(0xFF10B981)),
          ),
          const SizedBox(height: 20),
          const Text(
            'Sale Complete!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '₹${session.total.toStringAsFixed(2)} ${session.isCredit ? 'recorded as credit' : 'collected'}',
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 8),
          Text(
            'Customer: ${session.customerName}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 40),

          // New Sale button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                ref.read(posSessionProvider.notifier).resetSale();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'New Sale',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Back to dashboard
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () {
                ref.read(posSessionProvider.notifier).resetSale();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE5E7EB)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'Go to Dashboard',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF374151)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  QTY BUTTON
// ─────────────────────────────────────────────────────
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
          color: isAdd
              ? const Color(0xFF10B981).withOpacity(0.1)
              : Colors.transparent,
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