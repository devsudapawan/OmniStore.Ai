import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:omni_store_ai/core/design/colors.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/widgets/omni_drawer.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const OmniDrawer(),
      backgroundColor: const Color(0xFFF7F8FA),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor:AppColors.success,
        icon: const Icon(Icons.add_shopping_cart_rounded,color: AppColors.white,),
        label: const Text("Add Sale",style: TextStyle(color: AppColors.white),),
        onPressed: () {
          context.push(Routes.addSale);
        },
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          /// APP BAR
          _buildAppBar(context),

          /// MONEY SUMMARY
          SliverToBoxAdapter(child: _moneySection()),

          /// PRIMARY ACTION
          SliverToBoxAdapter(child: _primaryAction()),

          /// QUICK ACTIONS
          SliverToBoxAdapter(child: _quickActions()),

          /// ALERTS
          SliverToBoxAdapter(child: _alerts()),

          /// RECENT ACTIVITY
          SliverToBoxAdapter(child: _recentHeader()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, i) => _recentItem(),
              childCount: 5,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }

  /// APP BAR
  static SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      leading:Builder(
        builder: (context) => IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Good Morning",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
            ),
          ),
          Text(
            "My Store",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
      actions: [

        /// SYNC STATUS
        Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.cloud_done_rounded,
                  size: 14,
                  color: Color(0xFF10B981)),
              SizedBox(width: 4),
              Text(
                "Synced",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF10B981),
                ),
              )
            ],
          ),
        ),

        IconButton(
          icon: const Icon(Icons.notifications_none_rounded),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: const Color(0xFFE5E7EB),
        ),
      ),
    );
  }

  /// MONEY SECTION
  static Widget _moneySection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Expanded(
            child: _MoneyCard(
              title: "Today Sales",
              value: "₹4,250",
              color: Color(0xFF10B981),
              icon: Icons.trending_up_rounded,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _MoneyCard(
              title: "Pending Credit",
              value: "₹12,800",
              color: Color(0xFFF59E0B),
              icon: Icons.hourglass_empty_rounded,
            ),
          ),
        ],
      ),
    );
  }

  /// PRIMARY ACTION
  static Widget _primaryAction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.success,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Start New Sale",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// QUICK ACTIONS
  static Widget _quickActions() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Expanded(
            child: _QuickButton(
              label: "Add Payment",
              icon: Icons.payments_rounded,
              color: Color(0xFF10B981),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _QuickButton(
              label: "Add Product",
              icon: Icons.inventory_2_rounded,
              color: Color(0xFF8B5CF6),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _QuickButton(
              label: "Customer",
              icon: Icons.person_add_alt_rounded,
              color: Color(0xFFF59E0B),
            ),
          ),
        ],
      ),
    );
  }

  /// ALERTS
  static Widget _alerts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [

          _AlertCard(
            title: "Low Stock",
            subtitle: "3 items running low",
            color: Color(0xFFEF4444),
            icon: Icons.warning_amber_rounded,
          ),

          SizedBox(height: 10),

          _AlertCard(
            title: "Overdue Customers",
            subtitle: "2 customers pending payment",
            color: Color(0xFFF59E0B),
            icon: Icons.schedule_rounded,
          ),
        ],
      ),
    );
  }

  /// RECENT HEADER
  static Widget _recentHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 10),
      child: Text(
        "Recent Activity",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
      ),
    );
  }

  /// RECENT ITEM
  static Widget _recentItem() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Ramesh Kumar",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "₹450",
            style: TextStyle(
              color: Color(0xFF10B981),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

/// MONEY CARD
class _MoneyCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _MoneyCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(icon, color: color),

          const SizedBox(height: 10),

          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}

/// QUICK BUTTON
class _QuickButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _QuickButton({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(icon, color: color),

          const SizedBox(height: 6),

          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// ALERT CARD
class _AlertCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _AlertCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          Icon(icon, color: color),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}