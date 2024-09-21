import 'package:get/get.dart';

import '../data/datasources/remote/company.dart';
import '../data/services/services.dart';
import '../data/usecases/usecases.dart';
import '../domain/repositories/repositories.dart';
import '../domain/usecases/usecases.dart';
import '../infra/http.dart';
import '../presentation/controllers/controllers.dart';
import '../ui/pages/pages.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    //? Services
    Get.put<HttpClient>(HttpService());

    //? Repositories
    Get.lazyPut<CompaniesRepository>(
      () => RemoteCompanyDataSource(Get.find<HttpClient>()),
      fenix: true,
    );

    //? UseCases
    Get.lazyPut<GetCompaniesUseCase>(
      () => GetCompaniesUseCaseImpl(Get.find<CompaniesRepository>()),
      fenix: true,
    );

    //? Controllers
    Get.lazyPut<HomeController>(
      () => HomeControllerImpl(Get.find<GetCompaniesUseCase>()),
      fenix: true,
    );
  }
}
