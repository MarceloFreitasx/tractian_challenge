import 'package:flutter/material.dart';

abstract mixin class DebouncerMixin {
  void debouncerRun(VoidCallback action);
  void debouncerCancel();
}
