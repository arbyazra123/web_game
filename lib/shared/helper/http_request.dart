import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import '../shared.dart';

class Network {
  Network();
  Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
    retryPolicy: ExpiredTokenRetryPolicy(),
  );

  static const String APPLICATION_JSON = 'application/json';
  static const String CONTENT_TYPE = 'application/x-www-form-urlencoded';

  Future<dynamic> getRequest(String url, {bool withToken = true}) async {
    try {
      var headers = {
        'content-type': CONTENT_TYPE,
        'accept': APPLICATION_JSON,
      };
      final response = await client
          .get(
            "$url",
            headers: headers,
          )
          .timeout(Duration(seconds: 20));

      return response;
    } on TimeoutException catch (_) {
      throw Exception(_);
    }
  }

  Future<dynamic> putRequest(String url, dynamic body) async {
    final response = await client.put(
      "$url",
      headers: {
        'content-type': CONTENT_TYPE,
        'accept': APPLICATION_JSON,
      },
      body: body,
    );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> patchRequest(String url, dynamic body) async {
    final response = await client.patch(
      "$url",
      headers: {
        'content-type': CONTENT_TYPE,
        'accept': APPLICATION_JSON,
      },
      body: body,
    );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> postRequest(String url, Map<String, String> body,
      {bool withToken = true}) async {
    var headers = {
      'content-type': CONTENT_TYPE,
      'accept': APPLICATION_JSON,
    };
    try {
      final response = await client.post(
        "$url",
        headers: headers,
        body: body,
      );
      return response;
    } on TimeoutException catch (_) {
      throw Exception(_);
    }
  }

  Future<bool> postFiles(http.MultipartRequest body,
      {bool withToken = true}) async {
    // var headers = {
    //   'content-type': CONTENT_TYPE,
    //   'accept': APPLICATION_JSON,
    // };
    // //
    var accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
    body.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    var response = await client.send(body);
    if(response.statusCode==200){
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> delRequest(String url) async {
    final response = await client.delete(
      "$url",
      headers: {
        'Content-Type': APPLICATION_JSON,
        'Accept': APPLICATION_JSON,
      },
    );
    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }
}
