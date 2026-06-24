import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../../pos/providers/pos_session_provider.dart';

class CustomerDetailScreen extends ConsumerWidget {
  final String customerId;
  const CustomerDetailScreen({super.key, required this.customerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lookup customer from mockprovider for MVP. Later switch to Isar stream.
    final mockCustomers = ref.watch(mockCustomersProvider);
    final customer = mockCustomers.firstWhere(
      (c) => c['id'] == customerId,
      orElse: () => {'name': 'Unknown', 'phone': '', 'balance': 0.0},
    );

    final name = customer['name'] as String;
    final phone = customer['phone'] as String;
    final balance = (customer['balance'] as double?) ?? 0.0;
    
    // Derived UI states
    final hasDue = balance > 0;
    final trustLevel = hasDue ? (balance > 1000 ? 'High Risk' : 'Average') : 'Good';
    final trustColor = trustLevel == 'High Risk' ? const Color(0xFFEF4444) : (trustLevel == 'Average' ? const Color(0xFFF59E0B) : const Color(0xFF10B981));

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
          title: Text(
            name,
            style: const TextStyle(
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
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_rounded, color: Color(0xFF6B7280), size: 20),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── Top Info Card ──
                    _ProfileCard(
                      name: name,
                      phone: phone,
                      balance: balance,
                      hasDue: hasDue,
                      trustLevel: trustLevel,
                      trustColor: trustColor,
                    ),
                    const SizedBox(height: 16),
                    
                    // ── Action Buttons ──
                    _ActionButtonsBar(phone: phone, hasDue: hasDue),
                    const SizedBox(height: 24),
                    
                    // ── History Header ──
                    const Text(
                      'Transaction History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            
            // ── History List (Mock Data for now) ──
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Simulating alternating sales and payments
                    final isPayment = index % 3 == 0; 
                    return _HistoryTile(
                      isPayment: isPayment,
                      amount: isPayment ? 200.0 : 450.0,
                      date: 'Today, ${10 + index}:00 AM',
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final String phone;
  final double balance;
  final bool hasDue;
  final String trustLevel;
  final Color trustColor;

  const _ProfileCard({
    required this.name,
    required this.phone,
    required this.balance,
    required this.hasDue,
    required this.trustLevel,
    required this.trustColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar & Name
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3B82F6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.phone_rounded, size: 12, color: Color(0xFF9CA3AF)),
                          const SizedBox(width: 4),
                          Text(
                            phone,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Trust Indicator
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: trustColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(hasDue ? Icons.warning_rounded : Icons.verified_rounded, size: 12, color: trustColor),
                    const SizedBox(width: 4),
                    Text(
                      trustLevel,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: trustColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(height: 1, color: Color(0xFFE5E7EB)),
          ),
          // Ledger Balance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hasDue ? '₹${balance.toStringAsFixed(0)}' : 'Settled',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: hasDue ? const Color(0xFFEF4444) : const Color(0xFF10B981),
                      letterSpacing: -0.5,
                    ),
                  ),
                  if (hasDue)
                    const Text(
                      'Customer needs to pay',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFFEF4444),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButtonsBar extends StatelessWidget {
  final String phone;
  final bool hasDue;

  const _ActionButtonsBar({required this.phone, required this.hasDue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.chat_rounded,
            label: 'WhatsApp',
            color: const Color(0xFF10B981),
            onTap: () {
              // Trigger url_launcher
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.sms_rounded,
            label: 'SMS',
            color: const Color(0xFF3B82F6),
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.call_rounded,
            label: 'Call',
            color: const Color(0xFF6B7280),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final bool isPayment;
  final double amount;
  final String date;

  const _HistoryTile({required this.isPayment, required this.amount, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isPayment ? const Color(0xFF10B981).withOpacity(0.1) : const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isPayment ? Icons.account_balance_wallet_rounded : Icons.shopping_bag_rounded,
              size: 20,
              color: isPayment ? const Color(0xFF10B981) : const Color(0xFF6B7280),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isPayment ? 'Payment Received' : 'Sale (Udhar)',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isPayment ? '-' : '+'}₹${amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: isPayment ? const Color(0xFF10B981) : const Color(0xFFEF4444),
            ),
          ),
        ],
      ),
    );
  }
}
