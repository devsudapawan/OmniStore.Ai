import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/pos_session.dart';
import '../../providers/pos_session_provider.dart';

class CompleteSaleButton extends ConsumerWidget {
  final Future<void> Function() onComplete;

  const CompleteSaleButton({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);

    return Container(
      padding: const EdgeInsets.only(top: 24),
      width: double.infinity,
      height: 76,
      child: ElevatedButton(
        onPressed: session.canCompleteSale ? onComplete : null,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: session.canCompleteSale ? Colors.white : const Color(0xFF9CA3AF),
                ),
              ),
      ),
    );
  }
}