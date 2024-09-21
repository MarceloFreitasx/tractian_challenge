import '../entities/entities.dart';

abstract class CompaniesRepository {
  Future<List<CompanyEntity>> getCompanies();
  Future<List<AssetEntity>> getAssetsByCompany(String companyId);
  Future<List<LocationEntity>> getLocationsByCompany(String companyId);
}
