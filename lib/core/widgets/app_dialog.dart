import 'package:flutter/material.dart';

import '../design/colors.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String message;
  final String primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final bool isLoading;
  final bool isDestructive;
  final IconData icon;

  const AppDialog({
    super.key,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.isLoading = false,
    this.isDestructive = false,
    this.icon = Icons.logout_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          /// Dialog Card
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                /// Message
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 28),

                /// Buttons
                Row(
                  children: [
                    if (secondaryButtonText != null)
                      Expanded(
                        child: OutlinedButton(

                          onPressed:
                          isLoading ? null : onSecondaryPressed,
                          style: OutlinedButton.styleFrom(
                            padding:
                            const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          child: Text(secondaryButtonText!),
                        ),
                      ),

                    if (secondaryButtonText != null)
                      const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                        isLoading ? null : onPrimaryPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : Text(
                          primaryButtonText,
                          style: const TextStyle(
                             color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Floating Icon
          Positioned(
            top: 0,
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color:AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
