import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class AssetsController with LoadingMixin, DebouncerMixin {
  List<NodeEntity> get nodes;
  TextEditingController get searchController;
  bool get filterByEnergySensor;
  bool get filterByCriticalStatus;

  void filter();
  void onChangedSearch(String searchTerm);
  void switchFilterByCriticalStatus();
  void switchFilterByEnergySensor();
}
