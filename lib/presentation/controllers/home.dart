import 'package:get/get.dart';

import '../../ui/pages/pages.dart';
import '../navigator/navigator.dart';

class HomeControllerImpl implements HomeController {
  @override
  void goToCompanyAssets(String companyID) {
    Get.toNamed(
      AppRoutes.assets,
      arguments: companyID,
    );
  }
}
