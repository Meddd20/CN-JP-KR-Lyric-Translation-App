import 'package:Versalex/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UrlTextfield extends StatelessWidget {
  final TextEditingController urlController;
  final void Function() suffixIconOnpressed;
  final bool isEmpty;
  final String hintText;

  const UrlTextfield({
    super.key,
    required this.urlController,
    required this.suffixIconOnpressed,
    required this.isEmpty,
    this.hintText = 'https://youtube.com/watch?v=...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: urlController,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 13,
        ),
        filled: true,
        fillColor: AppColors.surface,
        suffixIcon: IconButton(
          onPressed: suffixIconOnpressed,
          icon: Icon(isEmpty ? Icons.link : Icons.clear),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
