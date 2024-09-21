import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/data/models/models.dart';

void main() {
  late Map<String, dynamic> json;
  late LocationModel locationModel;

  setUp(() {
    json = {
      "id": faker.guid.guid(),
      "name": faker.lorem.sentence(),
      "parentId": faker.guid.guid(),
    };
  });

  group('LocationModel', () {
    test('fromJson should create a valid LocationModel from a JSON map', () {
      locationModel = LocationModel.fromJson(json);

      expect(locationModel.id, json["id"]);
      expect(locationModel.name, json["name"]);
      expect(locationModel.parentId, json["parentId"]);
    });

    test('toEntity should convert an LocationModel to an LocationEntity', () {
      final locationEntity = locationModel.toEntity();

      expect(locationEntity.id, locationModel.id);
      expect(locationEntity.name, locationModel.name);
      expect(locationEntity.parentId, locationModel.parentId);
    });

    test('fromJson should handle empty values', () {
      final json = {
        "id": "",
        "name": "",
        "parentId": "",
      };

      final locationModel = LocationModel.fromJson(json);

      expect(locationModel.id, "");
      expect(locationModel.name, "");
      expect(locationModel.parentId, "");
    });

    test('fromJson should handle null values', () {
      final json = {
        "id": null,
        "name": null,
        "parentId": null,
      };

      final locationModel = LocationModel.fromJson(json);

      expect(locationModel.id, null);
      expect(locationModel.name, null);
      expect(locationModel.parentId, null);
    });

    test('fromJson should handle missing fields', () {
      final json = {
        "id": faker.guid.guid(),
      }; // Missing fields

      final locationModel = LocationModel.fromJson(json);

      expect(locationModel.id, json["id"]);
      expect(locationModel.name, null);
      expect(locationModel.parentId, null);
    });
  });
}
