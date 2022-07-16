import 'package:concierge/Services/web_services.dart';
import 'package:dio/dio.dart';

class RestPasswordService {
  final WebService _webService = WebService();

  Future<Response> resendEmail(String email) {
    return _webService.freeDio.post('dj-rest-auth/password/reset/',
        data: {'email': email});
  }
}
