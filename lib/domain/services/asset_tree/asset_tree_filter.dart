import 'package:flutter/foundation.dart';

import '../../entities/entities.dart';
import '../../params/params.dart';

abstract class AssetTreeFilter {
  Future<List<NodeEntity>> filter(List<NodeEntity> nodes, FilterParams params);
}

class AssetTreeFilterImpl implements AssetTreeFilter {
  @override
  Future<List<NodeEntity>> filter(List<NodeEntity> nodes, FilterParams params) async {
    if (params.isEmpty) return nodes;

    return await compute(_filterInBackground, {
      'nodes': nodes,
      'params': params,
    });
  }

  static List<NodeEntity> _filterInBackground(Map<String, dynamic> data) {
    List<NodeEntity> nodes = data['nodes'];
    FilterParams params = data['params'];

    List<NodeEntity> result = [];

    for (final root in nodes) {
      final path = _filterTree(root, params);
      if (path != null) {
        result.add(path);
      }
    }

    return result;
  }

  static NodeEntity? _filterTree(NodeEntity node, FilterParams params) {
    if (params.filter(node)) {
      return node;
    }

    List<NodeEntity> filteredChildren = [];
    for (var child in node.children) {
      NodeEntity? filteredChild = _filterTree(child, params);
      if (filteredChild != null) {
        filteredChildren.add(filteredChild);
      }
    }

    if (filteredChildren.isNotEmpty) {
      return NodeEntity(
        name: node.name,
        id: node.id,
        children: filteredChildren,
        node: node,
      );
    }

    return null;
  }
}
