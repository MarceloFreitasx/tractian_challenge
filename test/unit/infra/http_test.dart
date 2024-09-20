import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/data/helpers/helpers.dart';
import 'package:tractian_challenge/data/models/models.dart';

import '../mocks.dart';

void main() {
  late MockHttpClient sut;

  setUp(() {
    sut = MockHttpClient();
  });

  group('GET requests', () {
    test("should call GET method and return a successful response", () async {
      final url = faker.internet.httpUrl();
      final response = HttpResponse(faker.vehicle.vehicle(), HttpStatus.success);

      when(() => sut.request(method: HttpMethod.get, url: url)).thenAnswer((_) async => response);

      expect(await sut.request(method: HttpMethod.get, url: url), response);
      verify(() => sut.request(method: HttpMethod.get, url: url)).called(1);
    });

    test('should call GET method and throw an exception for non-200 status code', () async {
      final url = faker.internet.httpUrl();
      final response = Exception(HttpResponse('Error message', HttpStatus.unexpected));

      when(() => sut.request(method: HttpMethod.get, url: url)).thenThrow(response);

      expect(() => sut.request(method: HttpMethod.get, url: url), throwsException);
    });
  });

  group('POST requests', () {
    test("should call POST method and return a successful response", () async {
      final url = faker.internet.httpUrl();
      final data = faker.vehicle.vehicle();
      final response = HttpResponse(faker.vehicle.vehicle(), HttpStatus.success);

      when(() => sut.request(method: HttpMethod.post, url: url, data: data))
          .thenAnswer((_) async => response);

      expect(await sut.request(method: HttpMethod.post, url: url, data: data), response);
      verify(() => sut.request(method: HttpMethod.post, url: url, data: data)).called(1);
    });

    test('should call POST method and throw an exception for non-200 status code', () async {
      final url = faker.internet.httpUrl();
      final data = faker.vehicle.vehicle();
      final response = Exception(HttpResponse('Error message', HttpStatus.unexpected));

      when(() => sut.request(method: HttpMethod.post, url: url, data: data)).thenThrow(response);

      expect(() => sut.request(method: HttpMethod.post, url: url, data: data), throwsException);
    });
  });

  group('PUT requests', () {
    test("should call PUT method and return a successful response", () async {
      final url = faker.internet.httpUrl();
      final data = faker.vehicle.vehicle();
      final response = HttpResponse(faker.vehicle.vehicle(), HttpStatus.success);

      when(() => sut.request(method: HttpMethod.put, url: url, data: data))
          .thenAnswer((_) async => response);

      expect(await sut.request(method: HttpMethod.put, url: url, data: data), response);
      verify(() => sut.request(method: HttpMethod.put, url: url, data: data)).called(1);
    });

    test('should call PUT method and throw an exception for non-200 status code', () async {
      final url = faker.internet.httpUrl();
      final data = faker.vehicle.vehicle();
      final response = Exception(HttpResponse('Error message', HttpStatus.unexpected));

      when(() => sut.request(method: HttpMethod.put, url: url, data: data)).thenThrow(response);

      expect(() => sut.request(method: HttpMethod.put, url: url, data: data), throwsException);
    });
  });

  group('PATCH requests', () {
    test("should call PATCH method and return a successful response", () async {
      final url = faker.internet.httpUrl();
      final data = faker.vehicle.vehicle();
      final response = HttpResponse(faker.vehicle.vehicle(), HttpStatus.success);

      when(() => sut.request(method: HttpMethod.patch, url: url, data: data))
          .thenAnswer((_) async => response);

      expect(await sut.request(method: HttpMethod.patch, url: url, data: data), response);
      verify(() => sut.request(method: HttpMethod.patch, url: url, data: data)).called(1);
    });

    test('should call PATCH method and throw an exception for non-200 status code', () async {
      final url = faker.internet.httpUrl();
      final data = faker.vehicle.vehicle();
      final response = Exception(HttpResponse('Error message', HttpStatus.unexpected));

      when(() => sut.request(method: HttpMethod.patch, url: url, data: data)).thenThrow(response);

      expect(() => sut.request(method: HttpMethod.patch, url: url, data: data), throwsException);
    });
  });

  group('DELETE requests', () {
    test("should call DELETE method and return a successful response", () async {
      final url = faker.internet.httpUrl();
      final response = HttpResponse(faker.vehicle.vehicle(), HttpStatus.success);

      when(() => sut.request(method: HttpMethod.delete, url: url))
          .thenAnswer((_) async => response);

      expect(await sut.request(method: HttpMethod.delete, url: url), response);
      verify(() => sut.request(method: HttpMethod.delete, url: url)).called(1);
    });

    test('should call DELETE method and throw an exception for non-200 status code', () async {
      final url = faker.internet.httpUrl();
      final response = Exception(HttpResponse('Error message', HttpStatus.unexpected));

      when(() => sut.request(method: HttpMethod.delete, url: url)).thenThrow(response);

      expect(() => sut.request(method: HttpMethod.delete, url: url), throwsException);
    });
  });
}
