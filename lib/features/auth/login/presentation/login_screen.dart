import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:omni_store_ai/core/design/colors.dart';

import '../../../../app/routes/app_routes.dart';
import '../provider/login_provider.dart';
import 'otp_screen.dart';

/// -------------------------------------------------------
///  OmniStore.ai — Login Screen
///  Clean · Minimal · Professional
///  Colors sourced from AppColors
/// -------------------------------------------------------

class LoginScreen extends ConsumerStatefulWidget  {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _emailValid = false;
  final FocusNode _phoneFocus = FocusNode();
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  bool _phoneValid = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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

    _phoneController.addListener(() {
      final val = _phoneController.text.replaceAll(' ', '');
      setState(() => _phoneValid = val.length == 10);
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),

                    // ── Logo + Title ──
                    _buildHeader(),

                    const SizedBox(height: 48),

                    // ── Phone field ──
                    // _buildPhoneField(),
                    _buildEmailField(),

                    const SizedBox(height: 20),

                    // ── Continue button ──
                    _buildContinueButton(),

                    const SizedBox(height: 32),

                    // ── Divider ──
                    _buildDivider(),

                    const SizedBox(height: 28),

                    // ── Social buttons ──
                    _buildSocialButtons(),

                    const SizedBox(height: 40),

                    // ── Terms ──
                    _buildTerms(),

                    const SizedBox(height: 32),
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
  //  HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.09),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 7),
              const Text(
                'OmniStore.ai',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B82F6),
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Welcome\nback',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
            height: 1.15,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Sign in to manage your shop',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  PHONE FIELD
  // ─────────────────────────────────────────
  // Widget _buildPhoneField() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Mobile Number',
  //         style: TextStyle(
  //           fontSize: 13,
  //           fontWeight: FontWeight.w600,
  //           color: Color(0xFF374151),
  //           letterSpacing: 0.1,
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       Container(
  //         height: 54,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(14),
  //           border: Border.all(
  //             color: _phoneFocus.hasFocus
  //                 ? const Color(0xFF3B82F6)
  //                 : const Color(0xFFE5E7EB),
  //             width: _phoneFocus.hasFocus ? 1.5 : 1,
  //           ),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withOpacity(0.04),
  //               blurRadius: 8,
  //               offset: const Offset(0, 2),
  //             ),
  //           ],
  //         ),
  //         child: Row(
  //           children: [
  //             // Country code
  //             Container(
  //               width: 64,
  //               decoration: const BoxDecoration(
  //                 border: Border(
  //                   right: BorderSide(color: Color(0xFFE5E7EB)),
  //                 ),
  //               ),
  //               child: const Center(
  //                 child: Text(
  //                   '🇮🇳  +91',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w600,
  //                     color: Color(0xFF111827),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             // Input
  //             Expanded(
  //               child: TextField(
  //                 controller: _phoneController,
  //                 focusNode: _phoneFocus,
  //                 keyboardType: TextInputType.phone,
  //                 maxLength: 10,
  //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500,
  //                   color: Color(0xFF111827),
  //                   letterSpacing: 1.2,
  //                 ),
  //                 decoration: const InputDecoration(
  //                   border: InputBorder.none,
  //                   contentPadding:
  //                   EdgeInsets.symmetric(horizontal: 14, vertical: 0),
  //                   counterText: '',
  //                   hintText: '98765 43210',
  //                   hintStyle: TextStyle(
  //                     color: Color(0xFFD1D5DB),
  //                     fontWeight: FontWeight.w400,
  //                     letterSpacing: 0.5,
  //                   ),
  //                 ),
  //                 onChanged: (_) => setState(() {}),
  //               ),
  //             ),
  //             // Checkmark when valid
  //             if (_phoneValid)
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 14),
  //                 child: Container(
  //                   width: 22,
  //                   height: 22,
  //                   decoration: const BoxDecoration(
  //                     color: Color(0xFF10B981),
  //                     shape: BoxShape.circle,
  //                   ),
  //                   child: const Icon(Icons.check,
  //                       color: Colors.white, size: 13),
  //                 ),
  //               ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email Address',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFE5E7EB),
            ),
          ),
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 14),
              hintText: 'example@gmail.com',
            ),
            onChanged: (val) {
              final email = val.trim();

              setState(() {
                _emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(email);
              });
            },
          ),
        ),
      ],
    );
  }
  // ─────────────────────────────────────────
  //  CONTINUE BUTTON
  // ─────────────────────────────────────────
  Widget _buildContinueButton() {
    final state = ref.watch(loginProvider);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _emailValid && !state.isLoading ? _onContinue : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _emailValid
              ? const Color(0xFF3B82F6)
              : const Color(0xFFE5E7EB),
          foregroundColor:
          _emailValid ? Colors.white : const Color(0xFF9CA3AF),
          elevation: _emailValid ? 2 : 0,
          shadowColor: const Color(0xFF3B82F6).withOpacity(0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child:state.isLoading
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
              'Continue',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                color: _emailValid ? Colors.white : const Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.arrow_forward_rounded,
              size: 17,
              color: _emailValid ? Colors.white : const Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  DIVIDER
  // ─────────────────────────────────────────
  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1, color: const Color(0xFFE5E7EB)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(height: 1, color: const Color(0xFFE5E7EB)),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  SOCIAL BUTTONS
  // ─────────────────────────────────────────
  Widget _buildSocialButtons() {
    return Column(
      children: [
        // Google — full width, prominent
        _SocialButton(
          label: 'Continue with Google',
          icon: _googleIcon(),
          onTap: () {},
          bgColor: Colors.white,
          textColor: const Color(0xFF111827),
          borderColor: const Color(0xFFE5E7EB),
        ),
        const SizedBox(height: 12),
        // Apple + Facebook — side by side
        Row(
          children: [
            Expanded(
              child: _SocialButton(
                label: 'Apple',
                icon: const Icon(Icons.apple,
                    size: 28, color: AppColors.white),
                onTap: () {},
                bgColor: const Color(0xFF111827),
                textColor: Colors.white,
                borderColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                label: 'Facebook',
                icon: _facebookIcon(),
                onTap: () {},
                bgColor: const Color(0xFF1877F2),
                textColor: Colors.white,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  TERMS
  // ─────────────────────────────────────────
  Widget _buildTerms() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'By continuing, you agree to our ',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9CA3AF),
          ),
          children: const [
            TextSpan(
              text: 'Terms',
              style: TextStyle(
                color: Color(0xFF3B82F6),
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: Color(0xFF3B82F6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // ─────────────────────────────────────────
  //  ACTIONS
  // ─────────────────────────────────────────
  Future<void> _onContinue() async {
    final email = _emailController.text.trim();

    try {
      await ref.read(loginProvider.notifier).sendOtp(email);

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpScreen(email: email),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  // ─────────────────────────────────────────
  //  ICON HELPERS
  // ─────────────────────────────────────────
  Widget _googleIcon() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }

  Widget _facebookIcon() {
    return Icon(Icons.facebook, size: 28, color: Colors.white);

  }
}

// ─────────────────────────────────────────────────────
//  REUSABLE SOCIAL BUTTON
// ─────────────────────────────────────────────────────
class _SocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 9),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────
//  GOOGLE LOGO PAINTER
//  Draws the real Google 'G' logo using paths + colors
// ─────────────────────────────────────────────────────
class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = size.width / 2;

    // White background circle
    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()..color = Colors.white,
    );

    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: r);

    // Blue arc (right)
    canvas.drawArc(
      rect,
      -0.3,
      2.0,
      false,
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = size.width * 0.22
        ..style = PaintingStyle.stroke,
    );

    // Red arc (top-left)
    canvas.drawArc(
      rect,
      3.8,
      1.2,
      false,
      Paint()
        ..color = const Color(0xFFEA4335)
        ..strokeWidth = size.width * 0.22
        ..style = PaintingStyle.stroke,
    );

    // Yellow arc (bottom)
    canvas.drawArc(
      rect,
      1.7,
      1.2,
      false,
      Paint()
        ..color = const Color(0xFFFBBC05)
        ..strokeWidth = size.width * 0.22
        ..style = PaintingStyle.stroke,
    );

    // Green arc (bottom-left)
    canvas.drawArc(
      rect,
      2.9,
      0.9,
      false,
      Paint()
        ..color = const Color(0xFF34A853)
        ..strokeWidth = size.width * 0.22
        ..style = PaintingStyle.stroke,
    );

    // Horizontal bar for 'G'
    canvas.drawRect(
      Rect.fromLTWH(cx, cy - size.height * 0.11,
          r * 0.85, size.height * 0.22),
      Paint()..color = const Color(0xFF4285F4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}