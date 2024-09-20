import 'package:dio/dio.dart';

import '../data/helpers/helpers.dart';
import '../data/models/models.dart';
import '../data/services/services.dart';
import '../env/env.dart';

class HttpService implements HttpClient {
  HttpService() {
    httpClient = Dio();
    httpClient.options.followRedirects = false;
    httpClient.options.validateStatus = (status) => status! <= 422;
    //? Set http client base url
    httpClient.options.baseUrl = Env.to!.baseUrl;
  }

  late Dio httpClient;

  @override
  Future<HttpResponse> request({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    // Change http header request
    httpClient.options.headers.clear();
    if (headers != null) {
      httpClient.options.headers.addAll(headers);
    }

    // General headers settings
    httpClient.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    Response response = await handleMethod(
      url: url,
      data: data,
      method: method,
    );

    return handleResponse(response);
  }

  Future<Response> handleMethod({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? data,
  }) async {
    try {
      return switch (method) {
        HttpMethod.get => await httpClient.get(url, queryParameters: data),
        HttpMethod.post => await httpClient.post(url, data: data),
        HttpMethod.put => await httpClient.put(url, data: data),
        HttpMethod.patch => await httpClient.patch(url, data: data),
        HttpMethod.delete => await httpClient.delete(url, queryParameters: data)
      };
    } catch (_) {
      rethrow;
    }
  }

  HttpResponse handleResponse(Response response) {
    return switch (response.statusCode) {
      200 || 201 => HttpResponse(response.data, HttpStatus.success),
      400 => throw HttpResponse(response.data, HttpStatus.badRequest),
      401 => throw HttpResponse(response.data, HttpStatus.unauthenticated),
      403 => throw HttpResponse(response.data, HttpStatus.forbidden),
      404 => throw HttpResponse(response.data, HttpStatus.notFound),
      422 => throw HttpResponse(response.data, HttpStatus.unprocessableEntity),
      _ => throw HttpResponse(response.data, HttpStatus.unexpected)
    };
  }
}
