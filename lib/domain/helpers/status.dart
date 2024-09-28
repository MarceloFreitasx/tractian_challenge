import 'package:flutter/material.dart';

import '../../ui/styles/styles.dart';

enum AssetStatus {
  operating,
  alert;

  IconData? get icon => Icons.circle;

  Color? get iconColor => AppColors.caminePink;

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
