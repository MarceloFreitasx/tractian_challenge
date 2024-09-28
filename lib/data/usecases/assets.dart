import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetAssetsUseCaseImpl implements GetAssetsUseCase {
  final CompaniesRepository repository;

  GetAssetsUseCaseImpl(this.repository);

  @override
  Future<List<AssetEntity>> execute(String companyId) async {
    try {
      return await repository.getAssetsByCompany(companyId);
    } catch (_) {
      rethrow;
    }
  }
}
