import 'package:flutter/material.dart';

import '../../styles/styles.dart';

enum AssetCardType { location, asset, component }

enum AssetCardComponentType { vibration, energy }

enum AssetCardStatusType { operating, alert }

class AssetCard extends StatelessWidget {
  const AssetCard({
    super.key,
    required this.title,
    this.preffixIcon,
    this.suffixIcon,
    this.suffixIconColor = AppColors.kellyGreen,
    this.hasNext = false,
  });

  final String title;
  final IconData? preffixIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool hasNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        hasNext ? const Icon(Icons.arrow_drop_down_rounded) : const SizedBox(width: 24),
        if (preffixIcon != null)
          Icon(
            preffixIcon,
            color: AppColors.dodgerBlue,
          ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            title,
            style: AppTextStyle.bodyRegular,
          ),
        ),
        const SizedBox(width: 4),
        if (suffixIcon != null)
          Icon(
            suffixIcon,
            color: suffixIconColor,
            size: 12,
          ),
      ],
    );
  }
}
