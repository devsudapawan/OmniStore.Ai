import 'package:flutter/material.dart';

class OmniDrawer extends StatelessWidget {
  const OmniDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [

            /// HEADER
            _buildHeader(),

            const Divider(),

            /// MENU
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [

                  _drawerItem(
                    icon: Icons.person_outline,
                    title: "Profile",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: "Wallet",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.receipt_long_outlined,
                    title: "Transaction History",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.store_mall_directory_outlined,
                    title: "Business Settings",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.settings_outlined,
                    title: "App Settings",
                    onTap: () {},
                  ),

                  const Divider(),

                  _drawerItem(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.description_outlined,
                    title: "Terms & Conditions",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.info_outline,
                    title: "About App",
                    onTap: () {},
                  ),

                  const Divider(),

                  _drawerItem(
                    icon: Icons.logout_rounded,
                    title: "Logout",
                    isLogout: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            /// APP VERSION
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "OmniStore.ai v1.0.0",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// HEADER
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [

          /// Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6).withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.store_rounded,
              color: Color(0xFF3B82F6),
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "My Store",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  "Owner",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),

          const Icon(
            Icons.edit,
            size: 18,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  /// DRAWER ITEM
  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : const Color(0xFF374151),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : const Color(0xFF111827),
        ),
      ),
      onTap: onTap,
    );
  }
}