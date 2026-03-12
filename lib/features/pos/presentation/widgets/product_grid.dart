// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../model/cart_item.dart';
// import '../../providers/pos_session_provider.dart';
//
// class ProductGrid extends ConsumerWidget {
//   const ProductGrid({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final products = ref.watch(filteredProductsProvider);
//     final session = ref.watch(posSessionProvider);
//     final notifier = ref.read(posSessionProvider.notifier);
//
//     if (products.isEmpty) {
//       return const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.inventory_2_outlined,
//                 size: 48, color: Color(0xFFD1D5DB)),
//             SizedBox(height: 12),
//             Text(
//               'No products in this category',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Color(0xFF9CA3AF),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return GridView.builder(
//       padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
//       physics: const BouncingScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         childAspectRatio: 0.85,
//       ),
//       itemCount: products.length,
//       itemBuilder: (_, i) {
//         final p = products[i];
//         final cartItem = session.cart
//             .where((c) => c.productId == p['id'])
//             .firstOrNull;
//         final inCart = cartItem != null;
//         final qty = cartItem?.quantity ?? 0;
//
//         return _ProductCard(
//           id: p['id'] as String,
//           name: p['name'] as String,
//           price: p['price'] as double,
//           unit: p['unit'] as String,
//           inCart: inCart,
//           qty: qty,
//           onTap: () {
//             HapticFeedback.lightImpact();
//             notifier.addProduct(CartItem(
//               productId: p['id'] as String,
//               name: p['name'] as String,
//               price: p['price'] as double,
//               unit: p['unit'] as String,
//               quantity: 1,
//             ));
//           },
//           onIncrement: () {
//             HapticFeedback.selectionClick();
//             notifier.increment(p['id'] as String);
//           },
//           onDecrement: () {
//             HapticFeedback.selectionClick();
//             notifier.decrement(p['id'] as String);
//           },
//         );
//       },
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────
// //  PRODUCT CARD
// // ─────────────────────────────────────────────────────
// class _ProductCard extends StatelessWidget {
//   final String id;
//   final String name;
//   final double price;
//   final String unit;
//   final bool inCart;
//   final int qty;
//   final VoidCallback onTap;
//   final VoidCallback onIncrement;
//   final VoidCallback onDecrement;
//
//   const _ProductCard({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.unit,
//     required this.inCart,
//     required this.qty,
//     required this.onTap,
//     required this.onIncrement,
//     required this.onDecrement,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: inCart ? null : onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         decoration: BoxDecoration(
//           color: inCart
//               ? const Color(0xFF10B981).withOpacity(0.06)
//               : Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: inCart
//                 ? const Color(0xFF10B981)
//                 : const Color(0xFFE5E7EB),
//             width: inCart ? 1.5 : 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: inCart
//                   ? const Color(0xFF10B981).withOpacity(0.1)
//                   : Colors.black.withOpacity(0.03),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Top: icon + qty badge
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 34,
//                     height: 34,
//                     decoration: BoxDecoration(
//                       color: inCart
//                           ? const Color(0xFF10B981).withOpacity(0.15)
//                           : const Color(0xFFF3F4F6),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(
//                       Icons.inventory_2_rounded,
//                       size: 16,
//                       color: inCart
//                           ? const Color(0xFF10B981)
//                           : const Color(0xFF9CA3AF),
//                     ),
//                   ),
//                   if (inCart)
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: const BoxDecoration(
//                         color: Color(0xFF10B981),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Center(
//                         child: Text(
//                           '$qty',
//                           style: const TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//
//               // Bottom: name, price, controls
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF111827),
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     '₹${price.toStringAsFixed(0)}',
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w800,
//                       color: Color(0xFF10B981),
//                     ),
//                   ),
//                   Text(
//                     'per $unit',
//                     style: const TextStyle(
//                       fontSize: 9,
//                       color: Color(0xFF9CA3AF),
//                     ),
//                   ),
//
//                   // Qty stepper (only when in cart)
//                   if (inCart) ...[
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         _StepBtn(
//                           icon: Icons.remove,
//                           onTap: onDecrement,
//                           color: const Color(0xFF6B7280),
//                           bg: const Color(0xFFE5E7EB),
//                         ),
//                         Expanded(
//                           child: Center(
//                             child: Text(
//                               '$qty',
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xFF111827),
//                               ),
//                             ),
//                           ),
//                         ),
//                         _StepBtn(
//                           icon: Icons.add,
//                           onTap: onIncrement,
//                           color: Colors.white,
//                           bg: const Color(0xFF10B981),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _StepBtn extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   final Color color;
//   final Color bg;
//
//   const _StepBtn({
//     required this.icon,
//     required this.onTap,
//     required this.color,
//     required this.bg,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 22,
//         height: 22,
//         decoration: BoxDecoration(
//           color: bg,
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Icon(icon, size: 13, color: color),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/cart_item.dart';
import '../../providers/pos_session_provider.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(filteredProductsProvider);
    final session = ref.watch(posSessionProvider);
    final notifier = ref.read(posSessionProvider.notifier);

    if (products.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined,
                size: 48, color: Color(0xFFD1D5DB)),
            SizedBox(height: 12),
            Text(
              'No products in this category',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      // Extra bottom padding so FAB doesn't cover last row
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // Taller ratio — gives room for stepper without overflow
        childAspectRatio: 0.72,
      ),
      itemCount: products.length,
      itemBuilder: (_, i) {
        final p = products[i];
        final cartItem = session.cart
            .where((c) => c.productId == p['id'])
            .firstOrNull;
        final inCart = cartItem != null;
        final qty = cartItem?.quantity ?? 0;

        return _ProductCard(
          id: p['id'] as String,
          name: p['name'] as String,
          price: p['price'] as double,
          unit: p['unit'] as String,
          inCart: inCart,
          qty: qty,
          onTap: () {
            HapticFeedback.lightImpact();
            notifier.addProduct(CartItem(
              productId: p['id'] as String,
              name: p['name'] as String,
              price: p['price'] as double,
              unit: p['unit'] as String,
              quantity: 1,
            ));
          },
          onIncrement: () {
            HapticFeedback.selectionClick();
            notifier.increment(p['id'] as String);
          },
          onDecrement: () {
            HapticFeedback.selectionClick();
            // decrement to 0 removes from cart — FAB disappears automatically
            notifier.decrement(p['id'] as String);
          },
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────
//  PRODUCT CARD
// ─────────────────────────────────────────────────────
class _ProductCard extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final String unit;
  final bool inCart;
  final int qty;
  final VoidCallback onTap;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _ProductCard({
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
    required this.inCart,
    required this.qty,
    required this.onTap,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: inCart ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: inCart
              ? const Color(0xFF10B981).withOpacity(0.06)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: inCart
                ? const Color(0xFF10B981)
                : const Color(0xFFE5E7EB),
            width: inCart ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: inCart
                  ? const Color(0xFF10B981).withOpacity(0.1)
                  : Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(9),
        // Use Column with mainAxisSize.min to avoid overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Top row: icon + badge ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: inCart
                        ? const Color(0xFF10B981).withOpacity(0.15)
                        : const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(
                    Icons.inventory_2_rounded,
                    size: 15,
                    color: inCart
                        ? const Color(0xFF10B981)
                        : const Color(0xFF9CA3AF),
                  ),
                ),
                if (inCart)
                  Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$qty',
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 7),

            // ── Name ──
            Text(
              name,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 2),

            // ── Price ──
            Text(
              '₹${price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xFF10B981),
              ),
            ),

            // ── Unit ──
            Text(
              'per $unit',
              style: const TextStyle(
                fontSize: 9,
                color: Color(0xFF9CA3AF),
              ),
            ),

            // ── Qty stepper (only when in cart) ──
            if (inCart) ...[
              const SizedBox(height: 7),
              Row(
                children: [
                  _StepBtn(
                    icon: Icons.remove,
                    onTap: onDecrement,
                    color: const Color(0xFF6B7280),
                    bg: const Color(0xFFE5E7EB),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '$qty',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ),
                  ),
                  _StepBtn(
                    icon: Icons.add,
                    onTap: onIncrement,
                    color: Colors.white,
                    bg: const Color(0xFF10B981),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StepBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final Color bg;

  const _StepBtn({
    required this.icon,
    required this.onTap,
    required this.color,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 13, color: color),
      ),
    );
  }
}