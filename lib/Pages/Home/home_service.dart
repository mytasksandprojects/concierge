import 'package:concierge/Services/web_services.dart';
import 'package:dio/dio.dart';

class HomeService {
  final WebService _webService = WebService();

  Future<Response> getBanners() {
    return _webService.tokenDio.get('services/banners/');
  }
  Future<Response> getPromotions() {
    return _webService.tokenDio.get('services/promotions/');
  }

  Future<Response> getCategories() {
    return _webService.tokenDio.get('customers/list_categories/',queryParameters: {
      "limit":"20",
      "offset":"0"
    });
  }

}
