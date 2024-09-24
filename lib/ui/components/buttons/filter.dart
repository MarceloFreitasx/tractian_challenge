import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
    this.data, {
    super.key,
    required this.icon,
    this.active = false,
    this.onPressed,
  });

  final String data;
  final bool active;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(data),
      icon: Icon(
        icon,
        size: 18,
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: active ? AppColors.primary : Colors.transparent,
        foregroundColor: active ? Colors.white : AppColors.gray500,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: active ? Colors.transparent : AppColors.gray100,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
