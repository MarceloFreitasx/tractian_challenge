import '../../domain/entities/entities.dart';

class CompanyModel {
  String? id;
  String? name;

  CompanyModel({
    required this.id,
    required this.name,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"] as String?,
        name: json["name"] as String?,
      );

  CompanyEntity toEntity() => CompanyEntity(
        id: id,
        name: name,
      );
}
