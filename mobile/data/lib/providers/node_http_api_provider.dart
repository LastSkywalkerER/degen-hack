import 'dart:convert';

import 'package:core/core.dart';
import 'package:data/entities/login_payload.dart';
import 'package:data/entities/verify_payload.dart';
import 'package:dio/dio.dart';

import 'interceptors/http_api_client.dart';

class NodeHttpApiProvider {
  final HttpApiClient _httpApiClient;

  NodeHttpApiProvider({
    required HttpApiClient httpApiClient,
  }) : _httpApiClient = httpApiClient;

  Map<String, Object> getBody(String method) {
    return <String, Object>{
      'method': method,
      'params': <String>[],
      'id': 1,
      'jsonrpc': '2.0',
    };
  }

  Future<Response<dynamic>> login({required LoginPayload payload}) async {
    final Response<dynamic> loginResponse = await _httpApiClient.post(
      endpoint: NodeHttpApiConstants.login,
      body: jsonEncode(payload.toJson()),
    );

    return loginResponse;
  }

  Future<Response<dynamic>> verify({required VerifyPayload payload}) async {
    final Response<dynamic> loginResponse = await _httpApiClient.post(
      endpoint: NodeHttpApiConstants.verify,
      body: jsonEncode(payload.toJson()),
    );

    return loginResponse;
  }
}
