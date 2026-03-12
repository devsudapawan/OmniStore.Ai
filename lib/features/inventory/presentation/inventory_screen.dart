import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Inventory',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFE5E7EB)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_rounded,
                color: Color(0xFF3B82F6)),
            onPressed: () {},
          ),
        ],
      ),
      body: const _ComingSoonBody(
        icon: Icons.inventory_2_rounded,
        title: 'Inventory',
        subtitle: 'Track stock, categories\nand product history.',
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  SHARED PLACEHOLDER BODY
// ─────────────────────────────────────────────────────
class _ComingSoonBody extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ComingSoonBody({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6).withOpacity(0.08),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(icon, size: 34, color: const Color(0xFF3B82F6)),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6).withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Coming soon',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3B82F6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}