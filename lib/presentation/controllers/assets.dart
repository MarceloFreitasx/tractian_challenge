import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/params/filter.dart';
import '../../domain/services/services.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class AssetsControllerImpl extends GetxController
    with LoadingManager, DebouncerManager
    implements AssetsController {
  AssetsControllerImpl(
    this.getLocationsUC,
    this.getAssetsUC,
    this.assetTreeBuilder,
  );

  final GetLocationsUseCase getLocationsUC;
  final GetAssetsUseCase getAssetsUC;
  final AssetTreeService assetTreeBuilder;

  final _nodes = <NodeEntity>[].obs;
  final _filterByEnergySensor = false.obs;
  final _filterByCriticalStatus = false.obs;

  final locations = <LocationEntity>[];
  final assets = <AssetEntity>[];

  late String _companyId;

  @override
  List<NodeEntity> get nodes => _nodes;

  @override
  bool get filterByEnergySensor => _filterByEnergySensor.value;

  @override
  bool get filterByCriticalStatus => _filterByCriticalStatus.value;

  @override
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      _companyId = Get.arguments;
      init();
    }

    super.onInit();
  }

  void init() async {
    try {
      setLoadingStarted();
      await Future.wait([
        loadLocations(),
        loadAssets(),
      ]);

      await assetTreeBuilder.build(locations, assets).then((_) {
        _nodes.assignAll(assetTreeBuilder.assetTree);

        setLoadingCompleted();
      });
    } on Exception catch (e) {
      setLoadingError(e.toString());
    }
  }

  Future<void> loadLocations() async {
    try {
      locations.assignAll(await getLocationsUC.execute(_companyId));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> loadAssets() async {
    try {
      assets.assignAll(await getAssetsUC.execute(_companyId));
    } catch (_) {
      rethrow;
    }
  }

  @override
  void onChangedSearch(String searchTerm) {
    debouncerRun(() async {
      await filter();
    });
  }

  @override
  Future<void> filter() async {
    setLoadingStarted();

    await assetTreeBuilder.filter(FilterParams(
      searchTerm: searchController.text,
      status: filterByCriticalStatus ? AssetStatus.alert : null,
      type: filterByEnergySensor ? SensorType.energy : null,
    ));
    _nodes.assignAll(assetTreeBuilder.assetTree);
    setLoadingCompleted();
  }

  @override
  void switchFilterByEnergySensor() {
    _filterByEnergySensor.value = !_filterByEnergySensor.value;
    filter();
  }

  @override
  void switchFilterByCriticalStatus() {
    _filterByCriticalStatus.value = !_filterByCriticalStatus.value;
    filter();
  }
}
