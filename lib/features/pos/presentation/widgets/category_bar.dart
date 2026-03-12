import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/pos_session_provider.dart';

class CategoryBar extends ConsumerWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(mockCategoriesProvider);
    final selected = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final cat = categories[i];
          final isAll = cat == 'All';
          final isSelected =
              (isAll && selected == null) || (!isAll && selected == cat);

          return GestureDetector(
            onTap: () => ref
                .read(selectedCategoryProvider.notifier)
                .state = isAll ? null : cat,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF10B981)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF10B981)
                      : const Color(0xFFE5E7EB),
                ),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: const Color(0xFF10B981).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
                    : [],
              ),
              child: Text(
                cat,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFF6B7280),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}