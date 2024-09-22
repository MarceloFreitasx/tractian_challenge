import 'package:flutter/material.dart';

import '../../ui/styles/styles.dart';

enum SensorType {
  vibration,
  energy;

  IconData? get icon {
    switch (this) {
      case SensorType.energy:
        return Icons.bolt_rounded;
      default:
        return null;
    }
  }

  Color? get iconColor {
    switch (this) {
      case SensorType.energy:
        return AppColors.kellyGreen;
      default:
        return null;
    }
  }

  static SensorType? fromString(String? status) {
    switch (status) {
      case 'vibration':
        return SensorType.vibration;
      case 'energy':
        return SensorType.energy;
      default:
        return null;
    }
  }
}
