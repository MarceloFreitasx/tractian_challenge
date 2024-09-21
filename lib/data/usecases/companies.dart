import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetCompaniesUseCaseImpl implements GetCompaniesUseCase {
  final CompaniesRepository repository;

  GetCompaniesUseCaseImpl(this.repository);

  @override
  Future<List<CompanyEntity>> call() async {
    try {
      return await repository.getCompanies();
    } catch (_) {
      rethrow;
    }
  }
}
