import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class CompanyButton extends StatelessWidget {
  const CompanyButton({
    super.key,
    required this.title,
    this.icon = Icons.abc,
    this.onPressed,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        title,
        style: AppTextStyle.bodyMedium,
      ),
      icon: Icon(icon),
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
