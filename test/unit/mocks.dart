import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/data/services/services.dart';
import 'package:tractian_challenge/domain/usecases/usecases.dart';

//? Infra
class MockHttpClient extends Mock implements HttpClient {}

//? Use Cases
class MockCompanyUseCase extends Mock implements GetCompaniesUseCase {}

class MockLocationsUseCase extends Mock implements GetLocationsUseCase {}

class MockAssetsUseCase extends Mock implements GetAssetsUseCase {}
