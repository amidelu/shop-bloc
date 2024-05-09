import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learning_shop_bloc/environment.dart';
import 'package:learning_shop_bloc/global.dart';

class HttpUtil {
  // Creating singleton with internal constructor
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  // Creating dio instance
  late Dio dio;

  // Setting internal constructor with default value which will initialize when instantiate this class
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: Environment.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json: charset=utf-8',
        headers: getAuthorizationHeader(),
        responseType: ResponseType.json);

    dio = Dio(options);
  }

  Future postApi(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    if(kDebugMode) {
      print('Request end point: $path');
      print('Request Data: $data');
      print('Request query parameters: $queryParameters');
    }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    if(kDebugMode) {
      print('Response from post api: $response');
    }
    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic> {};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
