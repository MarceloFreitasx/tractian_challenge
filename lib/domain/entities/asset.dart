import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class AssetEntity {
  String? id;
  String? name;
  String? parentId;
  String? sensorId;
  SensorType? sensorType;
  AssetStatus? status;
  String? gatewayId;
  String? locationId;

  AssetEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
  });

  bool get isComponent => sensorType != null;

  IconData? get icon {
    if (status == AssetStatus.alert) {
      return status!.icon;
    }

    if (isComponent) {
      return sensorType!.icon;
    }

    return null;
  }

  Color? get iconColor {
    if (status == AssetStatus.alert) return status!.iconColor;
    if (isComponent) return sensorType!.iconColor;
    return null;
  }
}
