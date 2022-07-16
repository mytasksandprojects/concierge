import 'package:concierge/Services/web_services.dart';
import 'package:dio/dio.dart';

class LoginService {
  final WebService _webService = WebService();

  Future<Response> login(String email, String password) {
   return _webService.freeDio.post('dj-rest-auth/login/',data: {
    "email":email,
    "password":password
   });
  }
  Future<bool> setTokens(String token,String refreshToken){
    //there are tow tokens one initial and second when request return 401 in any request need token
    _webService.setRefreshToken(refreshToken);
   return _webService.setToken(token);
  }
}
