import 'package:core/core.dart';
import 'package:dio/dio.dart';

class HttpDioClient {
  final AppConfig _appConfig;

  final Dio _dio = Dio();

  Dio get dio => _dio;
  HttpDioClient({
    required AppConfig appConfig,
  }) : _appConfig = appConfig {
    _dio
      ..options.baseUrl = NodeHttpApiConstants.serverUrl
      ..interceptors.addAll(
        <Interceptor>[
          InterceptorsWrapper(),
        ],
      );
  }
}
