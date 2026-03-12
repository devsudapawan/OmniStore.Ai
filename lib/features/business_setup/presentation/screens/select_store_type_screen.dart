import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/business_setup_provider.dart';
import '../widgets/store_type_card.dart';
import 'business_questions_screen.dart';

class SelectStoreTypeScreen extends ConsumerStatefulWidget {
  const SelectStoreTypeScreen({super.key});

  @override
  ConsumerState<SelectStoreTypeScreen> createState() =>
      _SelectStoreTypeScreenState();
}

class _SelectStoreTypeScreenState
    extends ConsumerState<SelectStoreTypeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setupState = ref.watch(businessSetupProvider);
    final notifier = ref.read(businessSetupProvider.notifier);
    final selected = setupState.selectedStoreType;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: Column(
                children: [
                  // ── Header ──
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Step indicator
                        Row(
                          children: [
                            _StepDot(active: true),
                            const SizedBox(width: 6),
                            _StepDot(active: false),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'What type of\nshop do you run?',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                            height: 1.2,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'We\'ll set up your inventory categories automatically.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── Grid ──
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.05,
                        ),
                        itemCount: StoreType.values.length,
                        itemBuilder: (context, i) {
                          final type = StoreType.values[i];
                          return StoreTypeCard(
                            type: type,
                            isSelected: selected == type,
                            onTap: () => notifier.selectStoreType(type),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Continue button ──
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: selected != null
                            ? () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const BusinessQuestionsScreen(),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selected != null
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFFE5E7EB),
                          foregroundColor: selected != null
                              ? Colors.white
                              : const Color(0xFF9CA3AF),
                          elevation: selected != null ? 2 : 0,
                          shadowColor:
                              const Color(0xFF3B82F6).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              selected != null
                                  ? 'Continue with ${selected.label}'
                                  : 'Select a store type',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: selected != null
                                    ? Colors.white
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                            if (selected != null) ...[
                              const SizedBox(width: 6),
                              const Icon(Icons.arrow_forward_rounded,
                                  size: 17, color: Colors.white),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool active;
  const _StepDot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF3B82F6)
            : const Color(0xFFD1D5DB),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
