import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mbank_test/src/common/constants.dart';

class API {
  final String _endpoint = '';

  late BaseOptions options;

  late final Dio dio = Dio(options);

  API() {
    options = BaseOptions(
      baseUrl: _endpoint,
      contentType: Headers.jsonContentType,
      connectTimeout: httpStatusCode.connectTimeout,
      receiveTimeout: httpStatusCode.receiveTimeout,
    );
    dio.interceptors.add(_TokenInterceptor());
  }
}

class _TokenInterceptor extends Interceptor {
  // final SharedPrefs sharedPreferences;
  _TokenInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String defaultConfig = '${options.method} ${options.path}';

    String? authToken;
    if (authToken != null && authToken != '') {
      options.headers['Authorization'] = 'Bearer $authToken';
    }

    if (options.data != null) {
      if (options.data is FormData) {
        debugPrint(
          '--> $defaultConfig Request data: ${options.data.files ?? ''} ${options.data.fields ?? ''}',
        );
      } else {
        debugPrint(
          '--> $defaultConfig Request queryParameters: ${options.queryParameters.entries}',
        );
      }
    }

    if (options.headers.isNotEmpty) {
      debugPrint('--> $defaultConfig Request headers: ${options.headers}');
    }

    if(options.queryParameters.entries.isNotEmpty) {
      debugPrint(
        '--> $defaultConfig Request queryParameters: ${options.queryParameters.entries}',
      );
    }

    debugPrint('--- $defaultConfig');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
      '<-- ${response.requestOptions.method} ${response.requestOptions.path} ${response.statusCode} ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint('Error -->');
    debugPrint('${error.message} ${error.error}');
    debugPrint(error.response?.data.toString());
    debugPrint('Error -->');
    return super.onError(error, handler);
  }
}
