import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.onEditingComplete,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIcon;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.bodyRegular.copyWith(color: AppColors.gray500),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColors.gray500,
                size: 18,
              )
            : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.gray100,
        filled: true,
        isDense: true,
        constraints: const BoxConstraints.tightFor(height: 40),
      ),
    );
  }
}
