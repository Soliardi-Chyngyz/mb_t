import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SessionIntercepter extends InterceptorsWrapper {
  SessionIntercepter(this.api);

  final Dio api;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';

    debugPrint('REQUEST[${options.method}] => PATH_SessionI: ${options.path}');
    super.onRequest(options, handler); //continue
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH_SessionI: ${response.realUri.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint(err.error.toString());
    super.onError(err, handler);
  }
}
