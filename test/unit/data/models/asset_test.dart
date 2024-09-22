import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/data/models/models.dart';
import 'package:tractian_challenge/domain/helpers/helpers.dart';

void main() {
  late Map<String, dynamic> json;
  late AssetModel assetModel;

  setUp(() {
    json = {
      "id": faker.guid.guid(),
      "name": faker.lorem.sentence(),
      "parentId": faker.guid.guid(),
      "sensorId": faker.guid.guid(),
      "sensorType": "energy",
      "status": "alert",
      "gatewayId": faker.guid.guid(),
      "locationId": faker.guid.guid(),
    };
  });

  group('AssetModel', () {
    test('fromJson should create a valid AssetModel from a JSON map', () {
      assetModel = AssetModel.fromJson(json);

      expect(assetModel.id, json["id"]);
      expect(assetModel.name, json["name"]);
      expect(assetModel.parentId, json["parentId"]);
      expect(assetModel.sensorId, json["sensorId"]);
      expect(assetModel.sensorType, json["sensorType"]);
      expect(assetModel.status, json["status"]);
      expect(assetModel.gatewayId, json["gatewayId"]);
      expect(assetModel.locationId, json["locationId"]);
    });

    test('toEntity should convert an AssetModel to an AssetEntity', () {
      final assetEntity = assetModel.toEntity();

      expect(assetEntity.id, assetModel.id);
      expect(assetEntity.name, assetModel.name);
      expect(assetEntity.parentId, assetModel.parentId);
      expect(assetEntity.sensorId, assetModel.sensorId);
      expect(assetEntity.sensorType, SensorType.energy);
      expect(assetEntity.status, AssetStatus.alert);
      expect(assetEntity.gatewayId, assetModel.gatewayId);
      expect(assetEntity.locationId, assetModel.locationId);
    });

    test('fromJson should handle empty values', () {
      final json = {
        "id": "",
        "name": "",
        "parentId": "",
        "sensorId": "",
        "sensorType": "",
        "status": "",
        "gatewayId": "",
        "locationId": "",
      };

      final assetModel = AssetModel.fromJson(json);

      expect(assetModel.id, "");
      expect(assetModel.name, "");
      expect(assetModel.parentId, "");
      expect(assetModel.sensorId, "");
      expect(assetModel.sensorType, "");
      expect(assetModel.status, "");
      expect(assetModel.gatewayId, "");
      expect(assetModel.locationId, "");
    });

    test('fromJson should handle null values', () {
      final json = {
        "id": null,
        "name": null,
        "parentId": null,
        "sensorId": null,
        "sensorType": null,
        "status": null,
        "gatewayId": null,
        "locationId": null,
      };

      final assetModel = AssetModel.fromJson(json);

      expect(assetModel.id, null);
      expect(assetModel.name, null);
      expect(assetModel.parentId, null);
      expect(assetModel.sensorId, null);
      expect(assetModel.sensorType, null);
      expect(assetModel.status, null);
      expect(assetModel.gatewayId, null);
      expect(assetModel.locationId, null);
    });

    test('fromJson should handle missing fields', () {
      final json = {
        "id": faker.guid.guid(),
        "name": faker.lorem.sentence(),
        "parentId": faker.guid.guid(),
      }; // Missing fields

      final assetModel = AssetModel.fromJson(json);

      expect(assetModel.id, json["id"]);
      expect(assetModel.name, json["name"]);
      expect(assetModel.parentId, json["parentId"]);
      expect(assetModel.sensorId, null); // Should be null if missing
      expect(assetModel.sensorType, null); // Should be null if missing
      expect(assetModel.status, null); // Should be null if missing
      expect(assetModel.gatewayId, null); // Should be null if missing
      expect(assetModel.locationId, null); // Should be null if missing
    });
  });
}
