// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../providers/pos_session_provider.dart';
// import '../widgets/card_bottom_sheet.dart';
// import '../widgets/category_bar.dart';
// import '../widgets/product_grid.dart';
// import '../widgets/customer_selector.dart';
//
// class PosScreen extends ConsumerWidget {
//   const PosScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final session = ref.watch(posSessionProvider);
//
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark,
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF9FAFB),
//         body: Column(
//           children: [
//             // ── App Bar ──
//             _PosAppBar(session: session),
//
//             // ── Customer Selector ──
//             const CustomerSelector(),
//
//             // ── Category Bar ──
//             const SizedBox(height: 12),
//             const CategoryBar(),
//             const SizedBox(height: 12),
//
//             // ── Product Grid (full screen) ──
//             const Expanded(child: ProductGrid()),
//           ],
//         ),
//
//         // ── Floating Cart Button ──
//         floatingActionButton: session.cart.isNotEmpty
//             ? _CartFab(session: session)
//             : null,
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────
// //  APP BAR
// // ─────────────────────────────────────────────────────
// class _PosAppBar extends StatelessWidget {
//   final dynamic session;
//   const _PosAppBar({required this.session});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         bottom: false,
//         child: Container(
//           height: 56,
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               bottom: BorderSide(color: Color(0xFFE5E7EB)),
//             ),
//           ),
//           child: Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back_rounded,
//                     color: Color(0xFF111827), size: 22),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               const SizedBox(width: 4),
//               const Expanded(
//                 child: Text(
//                   'New Sale',
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF111827),
//                     letterSpacing: -0.3,
//                   ),
//                 ),
//               ),
//               // Search button
//               IconButton(
//                 icon: const Icon(Icons.search_rounded,
//                     color: Color(0xFF6B7280), size: 22),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────
// //  FLOATING CART BUTTON
// // ─────────────────────────────────────────────────────
// class _CartFab extends ConsumerWidget {
//   final dynamic session;
//   const _CartFab({required this.session});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final s = ref.watch(posSessionProvider);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: GestureDetector(
//         onTap: () => _openCart(context),
//         child: Container(
//           height: 58,
//           decoration: BoxDecoration(
//             color: const Color(0xFF10B981),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFF10B981).withOpacity(0.4),
//                 blurRadius: 16,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               // Item count badge
//               Container(
//                 margin: const EdgeInsets.only(left: 16),
//                 width: 28,
//                 height: 28,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.25),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '${s.totalItems}',
//                     style: const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               const Expanded(
//                 child: Text(
//                   'View Cart',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               // Total
//               Text(
//                 '₹${s.total.toStringAsFixed(0)}',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white,
//                   letterSpacing: -0.3,
//                 ),
//               ),
//               const SizedBox(width: 6),
//               const Icon(Icons.arrow_forward_ios_rounded,
//                   color: Colors.white, size: 14),
//               const SizedBox(width: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _openCart(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => const CartBottomSheet(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/pos_session_provider.dart';
import '../widgets/card_bottom_sheet.dart';
import '../widgets/category_bar.dart';
import '../widgets/product_grid.dart';
import '../widgets/customer_selector.dart';

// Must be ConsumerStatefulWidget so FAB rebuilds with session state
class PosScreen extends ConsumerWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch session here — FAB visibility depends on cart
    final session = ref.watch(posSessionProvider);
    final hasItems = session.cart.isNotEmpty;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: Column(
          children: [
            // ── App Bar ──
            const _PosAppBar(),

            // ── Customer Selector ──
            const CustomerSelector(),

            // ── Category Bar ──
            const SizedBox(height: 12),
            const CategoryBar(),
            const SizedBox(height: 12),

            // ── Product Grid (takes remaining space) ──
            const Expanded(child: ProductGrid()),
          ],
        ),

        // ── Floating Cart Button ──
        // AnimatedSlide gives it a smooth entrance/exit
        floatingActionButton: AnimatedSlide(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          offset: hasItems ? Offset.zero : const Offset(0, 2),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: hasItems ? 1.0 : 0.0,
            child: hasItems ? _CartFab(session: session) : const SizedBox.shrink(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  APP BAR
// ─────────────────────────────────────────────────────
class _PosAppBar extends StatelessWidget {
  const _PosAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Color(0xFFE5E7EB)),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded,
                    color: Color(0xFF111827), size: 22),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'New Sale',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search_rounded,
                    color: Color(0xFF6B7280), size: 22),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  FLOATING CART BUTTON
// ─────────────────────────────────────────────────────
class _CartFab extends StatelessWidget {
  final dynamic session;

  const _CartFab({required this.session});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => ProviderScope(
            parent: ProviderScope.containerOf(context),
            child: const CartBottomSheet(),
          ),
        ),
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            color: const Color(0xFF10B981),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF10B981).withOpacity(0.45),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // Item count badge
              Container(
                margin: const EdgeInsets.only(left: 14),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${session.totalItems}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'View Cart',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '₹${session.total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 14),
              const SizedBox(width: 14),
            ],
          ),
        ),
      ),
    );
  }
}