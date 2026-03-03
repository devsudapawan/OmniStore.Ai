

import 'package:flutter/material.dart';
import '../design/colors.dart';

enum CustomTextFieldType { email, password, number, normal }

class CustomTextFormWidget extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icons;
  final bool? obscureText;
  final int? maxLines;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final CustomTextFieldType fieldType;

  const CustomTextFormWidget({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.maxLines,
    this.icons,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.autovalidateMode,
    this.fieldType = CustomTextFieldType.normal,
  });

  // Custom validator based on field type
  String? _defaultValidator(String? value) {
    // switch (fieldType) {
    //   case CustomTextFieldType.email:
    //     if (value == null || value.isEmpty) return 'Email is required';
    //     if (!GetUtils.isEmail(value)) return 'Enter a valid email address';
    //     break;
    //   case CustomTextFieldType.password:
    //     if (value == null || value.isEmpty) return 'Password is required';
    //     if (value.length < 6) return 'Password must be at least 6 characters';
    //     break;
    //   case CustomTextFieldType.number:
    //     if (value == null || value.isEmpty) return 'Number is required';
    //     if (!GetUtils.isNumericOnly(value)) return 'Enter only numbers';
    //     break;
    //   default:
    //     return null;
    // }
    return null;
  }

  TextInputType _getKeyboardType() {
    switch (fieldType) {
      case CustomTextFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFieldType.password:
        return TextInputType.text;
      case CustomTextFieldType.number:
        return TextInputType.number;
      default:
        return keyboardType ?? TextInputType.text;
    }
  }

  bool _isObscure() {
    if (obscureText != null) return obscureText!;
    return fieldType == CustomTextFieldType.password;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: maxLines ?? 1,
      keyboardType: _getKeyboardType(),
      validator: validator ?? _defaultValidator,
      obscureText: _isObscure(),
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
            fontSize: 12, color: Colors.red, fontWeight: FontWeight.w400),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        hintText: labelText,
        fillColor: AppColors.textSecondary,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 15,
          fontWeight: FontWeight.w200,
        ),
        prefixIcon: icons != null
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: icons,
        )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: obscureText == true
                ? Icon(Icons.visibility_off, color: AppColors.textSecondary)
                : Icon(Icons.visibility, color: AppColors.textSecondary),
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
