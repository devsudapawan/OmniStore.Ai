import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omni_store_ai/core/design/colors.dart';

import '../../assistant/presentation/assistant_screen.dart';
import '../../customers/presentation/view/customer_screen.dart';
import '../../inventory/presentation/inventory_screen.dart';
import '../../records/presentation/records_screen.dart';
import 'dashboard_screen.dart';

/// -------------------------------------------------------
///  BottomNavBar — Root shell of OmniStore.ai
///  IndexedStack keeps all 5 screens alive in memory.
/// -------------------------------------------------------
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeDashboardScreen(),
    CustomersScreen(),
    InventoryScreen(),
    RecordsScreen(),
    AssistantScreen(),
  ];

  static const List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home_rounded,        label: 'Home'),
    _NavItem(icon: Icons.people_rounded,       label: 'Customers'),
    _NavItem(icon: Icons.inventory_2_rounded,  label: 'Inventory'),
    _NavItem(icon: Icons.receipt_long_rounded, label: 'Records'),
    _NavItem(icon: Icons.smart_toy_rounded,    label: 'Assistant'),
  ];

  void _onTabTap(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor:AppColors.white,
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: _OmniNavBar(
          currentIndex: _currentIndex,
          items: _navItems,
          onTap: _onTabTap,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  CUSTOM NAV BAR
// ─────────────────────────────────────────────────────

class _OmniNavBar extends StatelessWidget {
  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  const _OmniNavBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(items.length, (i) {
              final isActive = currentIndex == i;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(i),
                  behavior: HitTestBehavior.opaque,
                  child: _NavTabItem(
                    item: items[i],
                    isActive: isActive,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavTabItem extends StatelessWidget {
  final _NavItem item;
  final bool isActive;

  const _NavTabItem({required this.item, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            item.icon,
            size: 22,
            color: isActive
                ?  AppColors.primary
                : const Color(0xFF9CA3AF),
          ),
        ),
        const SizedBox(height: 3),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive
                ? AppColors.primary
                : const Color(0xFF9CA3AF),
          ),
          child: Text(item.label),
        ),
      ],
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}