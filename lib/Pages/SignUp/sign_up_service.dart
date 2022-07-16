import 'package:concierge/Models/User.dart';
import 'package:concierge/Services/web_services.dart';
import 'package:dio/dio.dart';

class SignUpService {
  final WebService _webService = WebService();

  Future<Response> signUp(UserModel user) {
    return _webService.freeDio.post('dj-rest-auth/registration/', data: {
      "username": user.userName,
      "email": user.email,
      "password1": user.password1,
      "password2": user.password2,
      "full_name": user.full_name,
      "invitation_code": user.invitation_code,
      "mobile": user.mobile, //"+201204421533",
      "dob": user.dob //"1999-08-17"
    });
  }
}
