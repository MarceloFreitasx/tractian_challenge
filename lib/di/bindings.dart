import 'package:get/get.dart';

import '../data/datasources/datasources.dart';
import '../data/services/services.dart';
import '../data/usecases/usecases.dart';
import '../domain/repositories/repositories.dart';
import '../domain/services/services.dart';
import '../domain/usecases/usecases.dart';
import '../infra/infra.dart';
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
    Get.lazyPut<GetAssetsUseCase>(
      () => GetAssetsUseCaseImpl(Get.find<CompaniesRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetLocationsUseCase>(
      () => GetLocationsUseCaseImpl(Get.find<CompaniesRepository>()),
      fenix: true,
    );

    //? Controllers
    Get.lazyPut<HomeController>(
      () => HomeControllerImpl(Get.find<GetCompaniesUseCase>()),
      fenix: true,
    );
    Get.lazyPut<AssetsController>(
      () => AssetsControllerImpl(
        Get.find<GetLocationsUseCase>(),
        Get.find<GetAssetsUseCase>(),
        AssetTreeServiceImpl(
          AssetTreeBuilderImpl(),
          AssetTreeFilterImpl(),
        ),
      ),
      fenix: true,
    );
  }
}
