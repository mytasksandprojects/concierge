import 'package:dio/dio.dart';
import '../../Services/web_services.dart';

class SplashScreenService {
  final WebService _webService = WebService();

  void initializeInterceptors() {
    //initial dio
    _webService.initializeInterceptors();
  }
}
