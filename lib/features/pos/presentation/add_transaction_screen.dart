import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../model/pos_session.dart';
import '../providers/pos_session_provider.dart';
import 'widgets/customer_selector.dart';
import 'widgets/product_grid.dart';
import 'widgets/payment_selector.dart';

class AddTransactionScreen extends ConsumerWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF111827), size: 24),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'New Sale',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
              letterSpacing: -0.5,
            ),
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: const Color(0xFFE5E7EB), height: 1),
          ),
        ),
        body: const Column(
          children: [
            SizedBox(height: 12),
            CustomerSelector(),
            SizedBox(height: 16),
            Expanded(child: ProductGrid()),
          ],
        ),
        bottomNavigationBar: _BottomActionBar(),
      ),
    );
  }
}

class _BottomActionBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).padding.bottom + 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFE5E7EB))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Grand Total',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                ),
              ),
              Text(
                '₹${session.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Payment Selector
          const PaymentSelector(),
          const SizedBox(height: 16),
          
          // Save Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: session.canCompleteSale
                  ? () async {
                      HapticFeedback.mediumImpact();
                      final success = await notifier.completeSale();
                      if (success && context.mounted) {
                        // After saving, route to customer profile
                        if (session.customerId != null) {
                          context.pushNamed('customer_detail', extra: session.customerId);
                        } else {
                          context.pop();
                        }
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: session.canCompleteSale
                    ? (session.isCredit ? const Color(0xFFF59E0B) : const Color(0xFF10B981))
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
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                    )
                  : Text(
                      session.paymentMethod == null
                          ? 'Select Payment'
                          : session.isCredit
                              ? 'Record Udhar (Credit)'
                              : 'Complete Sale',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: session.canCompleteSale ? Colors.white : const Color(0xFF9CA3AF),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}