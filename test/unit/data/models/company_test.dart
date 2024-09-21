import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/data/models/models.dart';

void main() {
  late Map<String, dynamic> json;
  late CompanyModel companyModel;

  setUp(() {
    json = {
      "id": faker.guid.guid(),
      "name": faker.lorem.sentence(),
    };
  });

  group('CompanyModel', () {
    test('fromJson should create a valid CompanyModel from a JSON map', () {
      companyModel = CompanyModel.fromJson(json);

      expect(companyModel.id, json["id"]);
      expect(companyModel.name, json["name"]);
    });

    test('toEntity should convert an CompanyModel to an CompanyEntity', () {
      final companyEntity = companyModel.toEntity();

      expect(companyEntity.id, companyModel.id);
      expect(companyEntity.name, companyModel.name);
    });

    test('fromJson should handle empty values', () {
      final json = {
        "id": "",
        "name": "",
      };

      final companyModel = CompanyModel.fromJson(json);

      expect(companyModel.id, "");
      expect(companyModel.name, "");
    });

    test('fromJson should handle null values', () {
      final json = {
        "id": null,
        "name": null,
      };

      final companyModel = CompanyModel.fromJson(json);

      expect(companyModel.id, null);
      expect(companyModel.name, null);
    });

    test('fromJson should handle missing fields', () {
      final json = {
        "id": faker.guid.guid(),
      }; // Missing fields

      final companyModel = CompanyModel.fromJson(json);

      expect(companyModel.id, json["id"]);
      expect(companyModel.name, null);
    });
  });
}
