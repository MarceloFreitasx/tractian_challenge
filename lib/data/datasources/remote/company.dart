import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class RemoteCompanyDataSource implements CompaniesRepository {
  final HttpClient httpClient;

  RemoteCompanyDataSource(this.httpClient);

  @override
  Future<List<CompanyEntity>> getCompanies() async {
    try {
      final result = await httpClient.request(
        method: HttpMethod.get,
        url: "/companies",
      );

      final data = result.data as List<dynamic>;
      return data.map((element) => CompanyModel.fromJson(element).toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<AssetEntity>> getAssetsByCompany(String companyId) async {
    try {
      final result = await httpClient.request(
        method: HttpMethod.get,
        url: "/$companyId/assets",
      );

      final data = result.data as List<dynamic>;
      return data.map((element) => AssetModel.fromJson(element).toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<LocationEntity>> getLocationsByCompany(String companyId) async {
    try {
      final result = await httpClient.request(
        method: HttpMethod.get,
        url: "/$companyId/locations",
      );

      final data = result.data as List<dynamic>;
      return data.map((element) => LocationModel.fromJson(element).toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }
}
