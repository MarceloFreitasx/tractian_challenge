import 'package:get/get.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/mixins/mixins.dart';

mixin LoadingManager on GetxController implements LoadingMixin {
  final _loadingStatus = LoadingStatus.completed.obs;
  final _errorMessage = ''.obs;

  @override
  LoadingStatus get loadingStatus => _loadingStatus.value;

  @override
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  @override
  String get errorMessage => _errorMessage.value;

  @override
  bool get isLoading => loadingStatus == LoadingStatus.loading;

  @override
  bool get isCompleted => loadingStatus == LoadingStatus.completed;

  @override
  bool get isEmpty => loadingStatus == LoadingStatus.empty;

  @override
  bool get hasError => loadingStatus == LoadingStatus.error;

  @override
  void setLoadingStarted() {
    _errorMessage.value = '';
    loadingStatus = LoadingStatus.loading;
  }

  @override
  void setLoadingCompleted() {
    loadingStatus = LoadingStatus.completed;
  }

  @override
  void setLoadingError(String message) {
    _errorMessage.value = message;
    loadingStatus = LoadingStatus.error;
  }

  @override
  void setLoadingAsEmpty() {
    loadingStatus = LoadingStatus.empty;
  }
}
