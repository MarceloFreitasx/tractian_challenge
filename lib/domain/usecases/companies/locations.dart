import '../../entities/entities.dart';

abstract class GetLocationsUseCase {
  Future<List<LocationEntity>> execute(String companyId);
}
