import '../../domain/entities/entities.dart';

class LocationModel {
  String? id;
  String? name;
  String? parentId;

  LocationModel({
    required this.id,
    required this.name,
    this.parentId,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"] as String?,
        name: json["name"] as String?,
        parentId: json["parentId"] as String?,
      );

  LocationEntity toEntity() => LocationEntity(
        id: id,
        name: name,
        parentId: parentId,
      );
}
