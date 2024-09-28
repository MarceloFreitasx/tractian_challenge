import 'package:flutter/material.dart';

import 'entities.dart';

class NodeEntity<T> {
  final String id;
  final T node;
  final String? name;
  final String? locationId;
  final String? parentId;
  int level;
  bool hasNext;
  List<NodeEntity> children;

  NodeEntity({
    required this.id,
    required this.node,
    this.name,
    this.parentId,
    this.locationId,
    this.level = 0,
    this.hasNext = false,
    this.children = const [],
  }) {
    if (children.isEmpty) {
      this.children = List.empty(growable: true);
    }
  }

  factory NodeEntity.fromAsset(AssetEntity asset) {
    return NodeEntity(
      id: asset.id!,
      node: asset as T,
      name: asset.name,
      parentId: asset.parentId,
      locationId: asset.locationId,
    );
  }

  factory NodeEntity.fromLocation(LocationEntity location) {
    return NodeEntity(
      id: location.id!,
      node: location as T,
      name: location.name,
      parentId: location.parentId,
    );
  }

  IconData get preffixIcon {
    if (node is AssetEntity) {
      if ((node as AssetEntity).isComponent) {
        return Icons.inbox;
      }
      return Icons.inventory_2_outlined;
    }
    return Icons.room_outlined;
  }

  IconData? get suffixIcon {
    if (node is AssetEntity) {
      return (node as AssetEntity).icon;
    }
    return null;
  }

  Color? get suffixIconColor {
    if (node is AssetEntity) {
      return (node as AssetEntity).iconColor;
    }
    return null;
  }
}
