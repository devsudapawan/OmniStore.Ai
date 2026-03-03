import 'package:flutter/material.dart';

import '../widgets/app_dialog.dart';

class DialogHelper {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required String primaryButtonText,
    required VoidCallback onPrimaryPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
    bool isLoading = false,
    bool isDestructive = false,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AppDialog(
          title: title,
          message: message,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onPrimaryPressed: onPrimaryPressed,
          onSecondaryPressed: onSecondaryPressed,
          isLoading: isLoading,
          isDestructive: isDestructive,
        );
      },
    );
  }
}
