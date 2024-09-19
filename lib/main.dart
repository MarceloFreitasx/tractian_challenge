import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'env/env.dart';
import 'presentation/navigator/navigator.dart';

void main() => Env();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tractian Challenge',
      getPages: PagesRoutes.routes,
      initialRoute: PagesRoutes.initial,
    );
  }
}
