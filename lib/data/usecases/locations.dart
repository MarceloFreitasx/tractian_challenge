import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetLocationsUseCaseImpl implements GetLocationsUseCase {
  final CompaniesRepository repository;

  GetLocationsUseCaseImpl(this.repository);

  @override
  Future<List<LocationEntity>> execute(String companyId) async {
    try {
      return await repository.getLocationsByCompany(companyId);
    } catch (_) {
      rethrow;
    }
  }
}
