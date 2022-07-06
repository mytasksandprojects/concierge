//contain all dio configurations and base URL
// base url is the domain of api
//www.crvd.com.co/login
//www.crvd.com.co/signup
//www.crvd.com.co/home
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String? userEmail;
  String userEmailLabel = 'Email';

  void initializeInterceptors() {}

  Future<bool?> removeUserToken() async {
    final SharedPreferences prefs = await _prefs;
    userEmail = null;
    return prefs.remove(userEmailLabel);
  }

  Future<bool> setUserToken(String token) async {
    userEmail = token;
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(userEmailLabel, token);
  }

  Future<String?> getEmailState() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(userEmailLabel) ?? null;
  }
}
