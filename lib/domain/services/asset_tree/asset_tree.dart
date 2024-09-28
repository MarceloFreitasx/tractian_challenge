import 'package:flutter/foundation.dart';

import '../../entities/entities.dart';
import '../../params/params.dart';
import '../services.dart';

abstract class AssetTreeService {
  List<NodeEntity> get assetTree;
  Future<void> build(List<LocationEntity> locations, List<AssetEntity> assets);
  Future<void> filter(FilterParams params);
}

class AssetTreeServiceImpl implements AssetTreeService {
  AssetTreeServiceImpl(this._treeBuilder, this._treeFilter);

  final AssetTreeBuilder _treeBuilder;
  final AssetTreeFilter _treeFilter;

  List<NodeEntity> _originalTree = [];
  List<NodeEntity> _filteredTree = [];
  List<NodeEntity> _assetTree = [];

  @override
  Future<void> build(List<LocationEntity> locations, List<AssetEntity> assets) async {
    _originalTree = await _treeBuilder.build(locations, assets);
    _filteredTree = List.from(_originalTree);
    await _buildAssetTree();
  }

  @override
  Future<void> filter(FilterParams params) async {
    _filteredTree = await _treeFilter.filter(_originalTree, params);
    await _buildAssetTree();
  }

  @override
  List<NodeEntity> get assetTree => _assetTree;

  Future<void> _buildAssetTree() async {
    _assetTree = await compute(_deconstructNodesForDisplay, {
      'nodesMap': _filteredTree,
    });
  }

  static List<NodeEntity> _deconstructNodesForDisplay(Map<String, List<NodeEntity>> nodesMap) {
    List<NodeEntity> nodes = [];
    for (var node in nodesMap['nodesMap']!) {
      nodes.addAll(deconstructNodes(node));
    }
    return nodes;
  }

  /// To increase the performance of building Widgets on the page,
  /// we deconstruct the nodes while maintaining the display order,
  /// thus avoiding nested lists, which would drastically decrease screen performance.
  static List<NodeEntity> deconstructNodes(NodeEntity node, {int level = 0}) {
    List<NodeEntity> nodes = [];
    node.level = level;
    nodes.add(node);

    for (var child in node.children) {
      node.hasNext = true;
      nodes.addAll(deconstructNodes(child, level: level + 1));
    }
    node.children.clear();

    return nodes;
  }
}
