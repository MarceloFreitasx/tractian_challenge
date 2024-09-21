import 'package:tractian_challenge/domain/entities/entities.dart';

abstract class HomeController {
  List<CompanyEntity> get companies;

  void goToCompanyAssets(String companyID);
}
