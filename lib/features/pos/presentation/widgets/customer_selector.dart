import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/pos_session_provider.dart';

class CustomerSelector extends ConsumerWidget {
  const CustomerSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(posSessionProvider);
    final hasCustomer = session.customerId != null;

    return GestureDetector(
      onTap: () => _showCustomerSheet(context, ref),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: hasCustomer
              ? const Color(0xFF10B981).withOpacity(0.06)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasCustomer
                ? const Color(0xFF10B981)
                : const Color(0xFFE5E7EB),
            width: hasCustomer ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: hasCustomer
                    ? const Color(0xFF10B981).withOpacity(0.15)
                    : const Color(0xFFF3F4F6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: hasCustomer
                    ? Text(
                  session.customerName[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF10B981),
                  ),
                )
                    : const Icon(Icons.person_outline_rounded,
                    size: 18, color: Color(0xFF9CA3AF)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasCustomer ? session.customerName : 'Walk-in Customer',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: hasCustomer
                          ? const Color(0xFF111827)
                          : const Color(0xFF6B7280),
                    ),
                  ),
                  if (hasCustomer)
                    const Text(
                      'Tap to change',
                      style: TextStyle(
                          fontSize: 10, color: Color(0xFF9CA3AF)),
                    )
                  else
                    const Text(
                      'Tap to select customer',
                      style: TextStyle(
                          fontSize: 10, color: Color(0xFF9CA3AF)),
                    ),
                ],
              ),
            ),
            if (hasCustomer)
              GestureDetector(
                onTap: () =>
                    ref.read(posSessionProvider.notifier).clearCustomer(),
                child: const Icon(Icons.close_rounded,
                    size: 18, color: Color(0xFF9CA3AF)),
              )
            else
              const Icon(Icons.keyboard_arrow_down_rounded,
                  size: 20, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }

  void _showCustomerSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProviderScope(
        parent: ProviderScope.containerOf(context),
        child: const _CustomerPickerSheet(),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  CUSTOMER PICKER SHEET
// ─────────────────────────────────────────────────────
class _CustomerPickerSheet extends ConsumerStatefulWidget {
  const _CustomerPickerSheet();

  @override
  ConsumerState<_CustomerPickerSheet> createState() =>
      _CustomerPickerSheetState();
}

class _CustomerPickerSheetState
    extends ConsumerState<_CustomerPickerSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final customers = ref.watch(mockCustomersProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    final filtered = customers
        .where((c) =>
    (c['name'] as String)
        .toLowerCase()
        .contains(_query.toLowerCase()) ||
        ((c['phone'] as String?) ?? '')
            .contains(_query))
        .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Title + Walk-in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Customer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    notifier.clearCustomer();
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Walk-in',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Search field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: TextField(
                autofocus: true,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  hintText: 'Search by name or phone...',
                  hintStyle: TextStyle(
                      fontSize: 13, color: Color(0xFFD1D5DB)),
                  prefixIcon: Icon(Icons.search_rounded,
                      size: 18, color: Color(0xFF9CA3AF)),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // List
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filtered.length,
              separatorBuilder: (_, __) =>
              const Divider(height: 1, color: Color(0xFFF3F4F6)),
              itemBuilder: (_, i) {
                final c = filtered[i];
                final balance = (c['balance'] as double?) ?? 0.0;
                final hasBalance = balance > 0;

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        (c['name'] as String)[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF10B981),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    c['name'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  subtitle: Text(
                    c['phone'] as String,
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFF9CA3AF)),
                  ),
                  trailing: hasBalance
                      ? Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                      const Color(0xFFF59E0B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '₹${balance.toStringAsFixed(0)} due',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF59E0B),
                      ),
                    ),
                  )
                      : null,
                  onTap: () {
                    notifier.setCustomer(
                      id: c['id'] as String,
                      name: c['name'] as String,
                    );
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}