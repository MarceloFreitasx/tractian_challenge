import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/domain/entities/entities.dart';
import 'package:tractian_challenge/domain/usecases/usecases.dart';

import '../../mocks.dart';

void main() {
  group('GetAssetsUseCase', () {
    late GetAssetsUseCase sut;
    late String companyId;

    setUp(() {
      companyId = faker.guid.guid();
      sut = MockAssetsUseCase();
    });

    test('should return a list of assets of a company', () async {
      when(() => sut.execute(companyId)).thenAnswer((_) async => [
            AssetEntity(id: faker.guid.guid(), name: faker.company.name()),
            AssetEntity(id: faker.guid.guid(), name: faker.company.name()),
          ]);

      final assets = await sut.execute(companyId);

      expect(assets, isA<List<AssetEntity>>());
      expect(assets.length, 2);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.execute(companyId)).thenThrow(Exception('Error fetching companies'));

      expect(() => sut.execute(companyId), throwsException);
    });
  });
}
