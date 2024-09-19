import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class CompanyButton extends StatelessWidget {
  const CompanyButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        title,
        style: AppTextStyle.bodyMedium,
      ),
      icon: const Icon(Icons.abc),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.dodgerBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 26),
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
