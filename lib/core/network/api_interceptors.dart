import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] = '';
    CacheHelper().getData(key: ApiKey.token) != null
        ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
