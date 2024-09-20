import '../../domain/entities/entities.dart';

class AssetModel {
  String? id;
  String? name;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  String? locationId;

  AssetModel({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        id: json["id"] as String?,
        name: json["name"] as String?,
        parentId: json["parentId"] as String?,
        sensorId: json["sensorId"] as String?,
        sensorType: json["sensorType"] as String?,
        status: json["status"] as String?,
        gatewayId: json["gatewayId"] as String?,
        locationId: json["locationId"] as String?,
      );

  AssetEntity toEntity() => AssetEntity(
        id: id,
        name: name,
        parentId: parentId,
        sensorId: sensorId,
        sensorType: sensorType,
        status: status,
        gatewayId: gatewayId,
        locationId: locationId,
      );
}
