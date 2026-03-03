import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/login_provider.dart';

/// -------------------------------------------------------
///  OmniStore.ai — OTP Verification Screen
///  Clean · Minimal · Professional
/// -------------------------------------------------------

class OtpScreen extends ConsumerStatefulWidget {
  final String email; // passed from LoginScreen

  const OtpScreen({super.key, required this.email});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen>
    with SingleTickerProviderStateMixin {
  // ── 6 OTP fields ──
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  // ── Countdown ──
  static const int _resendSeconds = 30;
  int _secondsLeft = _resendSeconds;
  Timer? _timer;
  bool _canResend = false;

  // ── State ──
  bool _isVerifying = false;
  bool _hasError = false;

  // ── Animation ──
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    ));
    _animController.forward();

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController.dispose();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  // ─────────────────────────────────────────
  //  TIMER
  // ─────────────────────────────────────────
  void _startTimer() {
    setState(() {
      _secondsLeft = _resendSeconds;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _onResend() {
    if (!_canResend) return;
    // Clear fields
    for (final c in _controllers) {
      c.clear();
    }
    setState(() => _hasError = false);
    _focusNodes[0].requestFocus();
    _startTimer();
    // TODO: trigger resend OTP via Supabase
  }

  // ─────────────────────────────────────────
  //  OTP INPUT LOGIC
  // ─────────────────────────────────────────
  void _onOtpChanged(String value, int index) {
    setState(() => _hasError = false);

    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }

    // Auto-verify when all 6 filled
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 6) {
      _onVerify();
    }
  }

  void _onOtpBackspace(int index) {
    if (_controllers[index].text.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }
  }

  String get _currentOtp =>
      _controllers.map((c) => c.text).join();

  bool get _otpComplete => _currentOtp.length == 6;

  // ─────────────────────────────────────────
  //  VERIFY
  // ─────────────────────────────────────────
  Future<void> _onVerify() async {
    if (!_otpComplete) return;

    final token = _currentOtp;

    final user = await ref.read(loginProvider.notifier).verifyOtp(
      email: widget.email,
      token: token,
    );

    if (user != null && mounted) {
      // Navigate to Store Type Screen
      Navigator.pushReplacementNamed(context, '/store-type');
    } else {
      setState(() => _hasError = true);
    }
  }

  // ─────────────────────────────────────────
  //  BUILD
  // ─────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // ── Back button ──
                    _buildBackButton(context),

                    const SizedBox(height: 40),

                    // ── Header ──
                    _buildHeader(),

                    const SizedBox(height: 44),

                    // ── OTP fields ──
                    _buildOtpFields(),

                    const SizedBox(height: 12),

                    // ── Error message ──
                    if (_hasError) _buildErrorMessage(),

                    const SizedBox(height: 32),

                    // ── Verify button ──
                    _buildVerifyButton(),

                    const SizedBox(height: 32),

                    // ── Resend row ──
                    _buildResendRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  BACK BUTTON
  // ─────────────────────────────────────────
  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          size: 18,
          color: Color(0xFF111827),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader() {
    // // Format: 98765 43210 → 98765 *****
    // final raw = widget.email.replaceAll(' ', '');
    // final masked = raw.length >= 10
    //     ? '${raw.substring(0, 5)} *****'
    //     : widget.phoneNumber;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon badge
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('💬', style: TextStyle(fontSize: 24)),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Verify your\nnumber',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
            height: 1.15,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'We sent a 6-digit OTP to ',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: widget.email,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  OTP FIELDS
  // ─────────────────────────────────────────
  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (i) => _buildSingleOtpBox(i)),
    );
  }

  Widget _buildSingleOtpBox(int index) {
    final isFilled = _controllers[index].text.isNotEmpty;
    final isFocused = _focusNodes[index].hasFocus;

    Color borderColor;
    if (_hasError) {
      borderColor = const Color(0xFFEF4444);
    } else if (isFocused) {
      borderColor = const Color(0xFF3B82F6);
    } else if (isFilled) {
      borderColor = const Color(0xFF3B82F6).withOpacity(0.4);
    } else {
      borderColor = const Color(0xFFE5E7EB);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 46,
      height: 56,
      decoration: BoxDecoration(
        color: isFilled
            ? const Color(0xFF3B82F6).withOpacity(0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: borderColor,
          width: isFocused ? 1.8 : 1.2,
        ),
        boxShadow: isFocused
            ? [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ]
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event is RawKeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            _onOtpBackspace(index);
          }
        },
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: _hasError
                ? const Color(0xFFEF4444)
                : const Color(0xFF111827),
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          onChanged: (val) {
            _onOtpChanged(val, index);
            setState(() {});
          },
          onTap: () => setState(() {}),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  ERROR MESSAGE
  // ─────────────────────────────────────────
  Widget _buildErrorMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: const [
          Icon(Icons.error_outline_rounded,
              size: 14, color: Color(0xFFEF4444)),
          SizedBox(width: 5),
          Text(
            'Invalid OTP. Please try again.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFFEF4444),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  VERIFY BUTTON
  // ─────────────────────────────────────────
  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: (_otpComplete && !_isVerifying) ? _onVerify : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _otpComplete
              ? const Color(0xFF3B82F6)
              : const Color(0xFFE5E7EB),
          foregroundColor:
          _otpComplete ? Colors.white : const Color(0xFF9CA3AF),
          elevation: _otpComplete ? 2 : 0,
          shadowColor: const Color(0xFF3B82F6).withOpacity(0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: _isVerifying
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Colors.white,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verify & Continue',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: _otpComplete
                    ? Colors.white
                    : const Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.verified_rounded,
              size: 17,
              color: _otpComplete
                  ? Colors.white
                  : const Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  RESEND ROW
  // ─────────────────────────────────────────
  Widget _buildResendRow() {
    return Center(
      child: _canResend
          ? GestureDetector(
        onTap: _onResend,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 11),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.refresh_rounded,
                  size: 16, color: Color(0xFF3B82F6)),
              SizedBox(width: 7),
              Text(
                'Resend OTP',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
        ),
      )
          : RichText(
        text: TextSpan(
          text: 'Resend OTP in ',
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF9CA3AF),
          ),
          children: [
            TextSpan(
              text: '${_secondsLeft}s',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF3B82F6),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}