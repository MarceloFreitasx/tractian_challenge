import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/mixins/mixins.dart';

mixin DebouncerManager implements DebouncerMixin {
  Timer? _timer;

  @override
  void debouncerRun(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), action);
  }

  @override
  void debouncerCancel() {
    _timer?.cancel();
  }
}
