import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/main.dart';

class TestHelper {
  static Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await Future.delayed(const Duration(seconds: 5));
  }

  static Future<void> ignoreException(Type exceptionType) async {
    final originalOnError = FlutterError.onError!;
    FlutterError.onError = (FlutterErrorDetails details) {
      final currentError = details.exception.runtimeType;
      if (currentError == exceptionType) {
        return;
      }
      originalOnError(details);
    };
  }
}
