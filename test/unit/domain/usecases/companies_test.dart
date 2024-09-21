import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/domain/entities/entities.dart';
import 'package:tractian_challenge/domain/usecases/usecases.dart';

import '../../mocks.dart';

void main() {
  group('GetCompaniesUseCase', () {
    late GetCompaniesUseCase sut;

    setUp(() {
      sut = MockCompanyUseCase();
    });

    test('should return a list of companies', () async {
      when(() => sut.getAll()).thenAnswer((_) async => [
            CompanyEntity(id: faker.guid.guid(), name: faker.company.name()),
            CompanyEntity(id: faker.guid.guid(), name: faker.company.name()),
          ]);

      final companies = await sut.getAll();
      expect(companies, isA<List<CompanyEntity>>());
      expect(companies.length, 2);
    });

    test('should throw an exception when usecase throws an exception', () async {
      when(() => sut.getAll()).thenThrow(Exception('Error fetching companies'));

      expect(() => sut.getAll(), throwsException);
    });
  });
}
