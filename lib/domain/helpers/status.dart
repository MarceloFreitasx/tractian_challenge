import 'package:flutter/material.dart';

import '../../ui/styles/styles.dart';

enum AssetStatus {
  operating,
  alert;

  IconData? get icon {
    switch (this) {
      case AssetStatus.alert:
        return Icons.circle;
      default:
        return null;
    }
  }

  Color? get iconColor {
    switch (this) {
      case AssetStatus.alert:
        return AppColors.caminePink;
      default:
        return null;
    }
  }

  static AssetStatus? fromString(String? status) {
    switch (status) {
      case 'operating':
        return AssetStatus.operating;
      case 'alert':
        return AssetStatus.alert;
      default:
        return null;
    }
  }
}
