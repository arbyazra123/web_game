import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';

import '../shared.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      print("request bearer");
      final accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
      data.headers[HttpHeaders.authorizationHeader]="Bearer "+accessToken;
    } catch (e) {
      print("failed to request bearer");
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
      return data;
  }

}