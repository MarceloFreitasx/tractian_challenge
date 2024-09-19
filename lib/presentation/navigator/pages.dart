import 'package:get/get.dart';

import '../../ui/pages/pages.dart';
import 'navigator.dart';

class PagesRoutes {
  PagesRoutes._();

  static const String initial = AppRoutes.home;

  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
  ];
}
