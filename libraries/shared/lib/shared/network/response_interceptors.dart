
import 'package:http_interceptor/http_interceptor.dart';


class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      
      return true;
    }

    return false;
  }
}
