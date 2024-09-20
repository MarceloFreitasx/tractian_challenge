import 'package:get/get.dart';

import '../presentation/controllers/controllers.dart';
import '../ui/pages/pages.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeControllerImpl(), fenix: true);
  }
}
