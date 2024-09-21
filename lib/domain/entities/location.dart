class LocationEntity {
  String? id;
  String? name;
  String? parentId;

  LocationEntity({
    required this.id,
    required this.name,
    this.parentId,
  });
}
