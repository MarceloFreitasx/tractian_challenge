import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../navigator/navigator.dart';

class HomeControllerImpl extends GetxController implements HomeController {
  HomeControllerImpl(this.getCompaniesUC);

  final GetCompaniesUseCase getCompaniesUC;

  final _companies = <CompanyEntity>[].obs;

  @override
  List<CompanyEntity> get companies => _companies;

  @override
  void onInit() {
    try {
      getCompaniesUC.call().then((value) => _companies.value = value);
    } catch (_) {}
    super.onInit();
  }

  @override
  void goToCompanyAssets(String companyID) {
    Get.toNamed(
      AppRoutes.assets,
      arguments: companyID,
    );
  }
}
