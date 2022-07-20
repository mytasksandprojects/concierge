import 'package:concierge/Models/Category.dart';
import 'package:concierge/Models/Promotions.dart';
import 'package:concierge/Pages/Home/home_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../Models/Banners.dart';

class HomeViewModel extends ViewModel {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  List<Banners> banners = [];
  List<Promotions> promotions = [];
  List<CategoryModel> categories = [];
  final HomeService _homeService = HomeService();

  @override
  void init() {
    //show loading to call api any api call must be loading show before and close loading after api response
    EasyLoading.show();
    Future.wait([
      getCategories(),
      getBanners(),
      getPromotions(),
    ]).whenComplete(() => EasyLoading.dismiss());
    super.init();
  }

  Future<void> getBanners() {
    return _homeService.getBanners().then((response) {
      final Iterable _bannersIterable = response.data['results'];
      _bannersIterable.forEach((element) {
        banners.add(Banners.fromJson(element));
        banners.add(Banners.fromJson(element));
      });
      notifyListeners();
    });
  }

  Future<void> getCategories() {
    return _homeService.getCategories().then((response) {
      final Iterable _categoriesIterable = response.data['results'];
      _categoriesIterable.forEach((element) {
        categories.add(CategoryModel.fromJson(element));
      });
      notifyListeners();
    });
  }

  Future<void> getPromotions() {
    return _homeService.getPromotions().then((response) {
      final Iterable _promotionsIterable = response.data['results'];
      _promotionsIterable.forEach((element) {
        promotions.add(Promotions.fromJson(element));
      });
      notifyListeners();
    });
  }
}
