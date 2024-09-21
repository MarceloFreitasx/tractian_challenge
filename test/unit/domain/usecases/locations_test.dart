import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/domain/entities/entities.dart';
import 'package:tractian_challenge/domain/usecases/usecases.dart';

import '../../mocks.dart';

void main() {
  group('GetLocationsUseCase', () {
    late GetLocationsUseCase sut;
    late String companyId;

    setUp(() {
      companyId = faker.guid.guid();
      sut = MockLocationsUseCase();
    });

    test('should return a list of locations of a company', () async {
      when(() => sut.execute(companyId)).thenAnswer((_) async => [
            LocationEntity(id: faker.guid.guid(), name: faker.company.name()),
            LocationEntity(id: faker.guid.guid(), name: faker.company.name()),
          ]);

      final locations = await sut.execute(companyId);

      expect(locations, isA<List<LocationEntity>>());
      expect(locations.length, 2);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.execute(companyId)).thenThrow(Exception('Error fetching companies'));

      expect(() => sut.execute(companyId), throwsException);
    });
  });
}
