import 'package:carousel_slider/carousel_controller.dart';
import 'package:concierge/Models/Category.dart';
import 'package:concierge/Models/Promotions.dart';
import 'package:concierge/Pages/Home/home_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../Models/Banners.dart';

class HomeViewModel extends ViewModel {
  int _pageIndex = 0;
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  CarouselController carouselController=CarouselController();
  PageController get pageController => _pageController;

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
    Future.wait([
      getCategories(),
      getBanners(),
      getPromotions(),
    ]);
    super.init();
  }

  Future<void> getBanners() {
    return _homeService.getBanners().then((response) {
      final Iterable _bannersIterable = response.data['results'];
      _bannersIterable.forEach((element) {
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
