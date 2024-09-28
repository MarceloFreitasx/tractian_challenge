import 'package:flutter/foundation.dart';

import '../../entities/entities.dart';

abstract class AssetTreeBuilder {
  Future<List<NodeEntity>> build(List<LocationEntity> locations, List<AssetEntity> assets);
}

class AssetTreeBuilderImpl implements AssetTreeBuilder {
  @override
  Future<List<NodeEntity>> build(List<LocationEntity> locations, List<AssetEntity> assets) async {
    final nodesMap = await compute(_buildInBackground, {
      'locations': locations,
      'assets': assets,
    });

    return await connect(nodesMap);
  }

  static Map<String, NodeEntity> _buildInBackground(Map<String, dynamic> data) {
    List<LocationEntity> locations = data['locations'];
    List<AssetEntity> assets = data['assets'];

    final nodesMap = <String, NodeEntity>{};

    for (var item in [...locations, ...assets]) {
      NodeEntity? nodeEntity = _createNodeEntity(item);
      if (nodeEntity != null) nodesMap[nodeEntity.id] = nodeEntity;
    }

    return nodesMap;
  }

  static NodeEntity? _createNodeEntity(dynamic entity) {
    if (entity is AssetEntity) {
      return NodeEntity.fromAsset(entity);
    } else if (entity is LocationEntity) {
      return NodeEntity.fromLocation(entity);
    }
    return null;
  }

  Future<List<NodeEntity>> connect(Map<String, NodeEntity> nodesMap) async {
    return await compute(_connectInBackground, nodesMap);
  }

  static List<NodeEntity> _connectInBackground(Map<String, NodeEntity> nodesMap) {
    for (var node in nodesMap.values) {
      if (node.parentId != null) {
        if (nodesMap.containsKey(node.parentId)) {
          nodesMap[node.parentId]!.children.add(node);
        }
      } else if (node.locationId != null) {
        if (nodesMap.containsKey(node.locationId)) {
          nodesMap[node.locationId]!.children.add(node);
        }
      }
    }

    return nodesMap.values
        .where((node) => node.locationId == null && node.parentId == null)
        .toList();
  }
}
