import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class HttpApiClient {
  final Dio _dioClient;

  HttpApiClient({
    required Dio dioClient,
  }) : _dioClient = dioClient;

  Future<Response<dynamic>> post({
    dynamic body,
    required String endpoint,
  }) async {
    try {
      final Response<dynamic> result = await _dioClient.post(
        endpoint,
        data: body,
      );
      return result;
    } on Exception catch (exception) {
      final AppException appException = AppException(exception.toString());
      throw appException;
    }
  }

  Future<Response<dynamic>> get({
    required String endpoint,
  }) async {
    try {
      final Response<dynamic> result = await _dioClient.get(endpoint);
      return result;
    } on Exception catch (exception) {
      final AppException appException = AppException(exception.toString());
      throw appException;
    }
  }
}
