import '../../../domain/entities/entities.dart';
import '../../../domain/mixins/mixins.dart';

abstract class HomeController with LoadingMixin {
  List<CompanyEntity> get companies;

  void goToCompanyAssets(String companyID);
}
