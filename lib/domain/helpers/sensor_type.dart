import 'package:flutter/material.dart';

import '../../ui/styles/styles.dart';

enum SensorType {
  vibration,
  energy;

  IconData? get icon => Icons.bolt_rounded;

  Color? get iconColor => AppColors.kellyGreen;

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
