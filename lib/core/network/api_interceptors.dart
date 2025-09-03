import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getData(key: ApiKey.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
