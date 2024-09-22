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
}
