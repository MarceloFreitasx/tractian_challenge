import '../entities/entities.dart';

abstract class GetCompaniesUseCase {
  Future<List<CompanyEntity>> call();
}
