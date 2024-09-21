import '../entities/entities.dart';

abstract class GetAssetsUseCase {
  Future<List<AssetEntity>> execute(String companyId);
}
