import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void show({
    required String message,
    ToastType type = ToastType.info,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: _backgroundColor(type),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 14,
    );
  }

  static Color _backgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
      default:
        return Colors.black87;
    }
  }
}

enum ToastType {
  success,
  error,
  warning,
  info,
}
