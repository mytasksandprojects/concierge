import 'package:dio/dio.dart';
import '../../Services/web_services.dart';

class SplashScreenService {
  final WebService _webService = WebService(); //call initializeInterceptors()

  void initializeInterceptors() {
    //initial dio
    _webService.initializeInterceptors();
  }
  Future<String?>getLang(){
    return _webService.getCurrentLang();
  }
  Future<String?>getToken(){
    return _webService.getToken();
  }

}
