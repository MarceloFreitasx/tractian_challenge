import '../../data/helpers/helpers.dart';

class HttpResponse<T> {
  T data;
  HttpStatus statusCode;

  HttpResponse(this.data, this.statusCode);

  Map<String, Object> toJson() => {
        'data': data.toString(),
        'statusCode': statusCode,
      };
}
