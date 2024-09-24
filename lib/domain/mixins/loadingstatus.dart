import '../helpers/helpers.dart';

abstract mixin class LoadingMixin {
  LoadingStatus get loadingStatus;
  set loadingStatus(LoadingStatus value);
  String get errorMessage;

  bool get isLoading;
  bool get isCompleted;
  bool get isEmpty;
  bool get hasError;

  void setLoadingStarted();
  void setLoadingCompleted();
  void setLoadingError(String message);
  void setLoadingAsEmpty();
}
