


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/app_routes.dart';
import '../../providers/business_setup_provider.dart';

/// -------------------------------------------------------
///  SetupLoaderScreen
///  Executes business setup tasks one by one.
///  Each task calls a real provider method and waits.
///  Tracks completedSteps from provider state.
/// -------------------------------------------------------
class SetupLoaderScreen extends ConsumerStatefulWidget {
  const SetupLoaderScreen({super.key});

  @override
  ConsumerState<SetupLoaderScreen> createState() =>
      _SetupLoaderScreenState();
}

class _SetupLoaderScreenState extends ConsumerState<SetupLoaderScreen>
    with TickerProviderStateMixin {

  // ── Task definitions (display only) ──
  static const List<_TaskMeta> _taskMeta = [
    _TaskMeta(icon: '🏪', title: 'Creating your business profile',   subtitle: 'Name, type & currency'),
    _TaskMeta(icon: '💳', title: 'Setting up payment methods',       subtitle: 'Cash, UPI & more'),
    _TaskMeta(icon: '📦', title: 'Creating product categories',      subtitle: 'Based on your store type'),
    _TaskMeta(icon: '⚙️', title: 'Saving your settings',             subtitle: 'Units, credit & currency'),
    _TaskMeta(icon: '✅', title: 'Almost ready!',                     subtitle: 'Preparing your dashboard'),
  ];

  // ── Animations ──
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  bool _started = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeController.forward();

    // Delay slightly so screen renders before starting
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_started) {
        _started = true;
        _runSetup();
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────
  //  SETUP EXECUTION
  // ─────────────────────────────────────────

  Future<void> _runSetup() async {
    final notifier = ref.read(businessSetupProvider.notifier);

    // Run all 4 steps — notifier updates completedSteps after each
    await notifier.completeBusinessSetup();

    if (!mounted) return;

    final setupState = ref.read(businessSetupProvider);

    if (setupState.setupStatus == SetupStatus.success) {
      // Brief pause so user sees the success state
      // refresh router providers
      ref.invalidate(setupCompletedProvider);

      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      context.go(Routes.BOTTOMNAVBAR); // Routes.BOTTOMNAVBAR
    }
    // Error case is handled in build() via setupStatus
  }

  // ─────────────────────────────────────────
  //  BUILD
  // ─────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final setupState = ref.watch(businessSetupProvider);
    final storeType = setupState.selectedStoreType ?? StoreType.grocery;
    final completedSteps = setupState.completedSteps;
    final isError = setupState.setupStatus == SetupStatus.error;
    final isSuccess = setupState.setupStatus == SetupStatus.success;

    // Progress: show extra "done" step when fully complete
    // final progress = isSuccess
    //     ? 1.0
    //     : completedSteps / _taskMeta.length;
    final progress = completedSteps / 4;

    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: isError
                ? _buildErrorState(setupState.errorMessage)
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // ── Center icon ──
                  ScaleTransition(
                    scale: isSuccess
                        ? const AlwaysStoppedAnimation(1.0)
                        : _pulseAnim,
                    child: _buildCenterIcon(storeType, isSuccess),
                  ),

                  const SizedBox(height: 28),

                  // ── Title ──
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      isSuccess
                          ? 'You\'re all set! 🎉'
                          : 'Setting up your shop...',
                      key: ValueKey(isSuccess),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    isSuccess
                        ? 'Taking you to your dashboard...'
                        : 'This will only take a moment',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),

                  const SizedBox(height: 36),

                  // ── Progress bar ──
                  _buildProgressBar(progress, isSuccess),

                  const SizedBox(height: 32),

                  // ── Task list ──
                  _buildTaskList(completedSteps, isSuccess),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  WIDGETS
  // ─────────────────────────────────────────

  Widget _buildCenterIcon(StoreType storeType, bool isSuccess) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: isSuccess
            ? const Color(0xFF10B981).withOpacity(0.15)
            : const Color(0xFF3B82F6).withOpacity(0.15),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: isSuccess
              ? const Color(0xFF10B981).withOpacity(0.4)
              : const Color(0xFF3B82F6).withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: isSuccess
              ? const Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF10B981),
            size: 40,
            key: ValueKey('check'),
          )
              : Text(
            storeType.emoji,
            key: const ValueKey('emoji'),
            style: const TextStyle(fontSize: 38),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(double progress, bool isSuccess) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${(progress * 100).round()}%',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(milliseconds: 400),
            builder: (_, value, __) => LinearProgressIndicator(
              value: value,
              backgroundColor: const Color(0xFF1F2937),
              valueColor: AlwaysStoppedAnimation<Color>(
                isSuccess
                    ? const Color(0xFF10B981)
                    : const Color(0xFF3B82F6),
              ),
              minHeight: 6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskList(int completedSteps, bool isSuccess) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        children: _taskMeta.asMap().entries.map((entry) {
          final i = entry.key;
          final meta = entry.value;
          // step indices are 1-based from notifier
          final isDone = completedSteps > i || isSuccess;
          final isActive = completedSteps == i &&
              !isSuccess;
          final isLast = i == _taskMeta.length - 1;

          return _TaskRow(
            meta: meta,
            isDone: isDone,
            isActive: isActive,
            isLast: isLast,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildErrorState(String? message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444).withOpacity(0.15),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                color: Color(0xFFEF4444),
                size: 36,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Setup failed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message ?? 'Something went wrong. Please try again.',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF9CA3AF),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Reset and retry
                  ref.read(businessSetupProvider.notifier).reset();
                  _started = false;
                  _runSetup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  TASK META (display only — no state)
// ─────────────────────────────────────────────────────

class _TaskMeta {
  final String icon;
  final String title;
  final String subtitle;
  const _TaskMeta(
      {required this.icon, required this.title, required this.subtitle});
}

// ─────────────────────────────────────────────────────
//  TASK ROW WIDGET
// ─────────────────────────────────────────────────────

class _TaskRow extends StatelessWidget {
  final _TaskMeta meta;
  final bool isDone;
  final bool isActive;
  final bool isLast;

  const _TaskRow({
    required this.meta,
    required this.isDone,
    required this.isActive,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF3B82F6).withOpacity(0.08)
            : Colors.transparent,
        borderRadius: isLast
            ? const BorderRadius.vertical(bottom: Radius.circular(16))
            : BorderRadius.zero,
        border: isLast
            ? null
            : const Border(
            bottom:
            BorderSide(color: Color(0xFF374151), width: 0.5)),
      ),
      child: Row(
        children: [
          // Status icon
          SizedBox(
            width: 28,
            height: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isDone
                  ? Container(
                key: const ValueKey('done'),
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check,
                    color: Colors.white, size: 14),
              )
                  : isActive
                  ? const SizedBox(
                key: ValueKey('loading'),
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFF3B82F6),
                ),
              )
                  : Container(
                key: const ValueKey('pending'),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF374151),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meta.title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDone || isActive
                        ? Colors.white
                        : const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  meta.subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          Text(
            meta.icon,
            style: TextStyle(
              fontSize: 18,
              color: isDone || isActive ? null : const Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }
}