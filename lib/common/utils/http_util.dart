import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learning_shop_bloc/environment.dart';

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
        headers: {},
        responseType: ResponseType.json);

    dio = Dio(options);
  }

  Future postApi(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    if(kDebugMode) {
      print('Response from post api: ${response.data}');
    }
    return response.data;
  }
}
