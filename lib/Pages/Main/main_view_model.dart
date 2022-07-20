import 'package:auto_size_text/auto_size_text.dart';
import 'package:concierge/Pages/Home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../Style/custom_icons.dart';

class MainViewModel extends ViewModel{
  List<Widget> views = [
    Home(),
    Container(),
    Container(),
    Container(),//call profile screen that you created
  ];
  List<String>? tabsTitles = ['Home','Requests','Notifications','Profile'];
  List<IconData>? tabsIcons = [
    CustomIcons.homeTab,
    CustomIcons.iconly_bold_mail,
    CustomIcons.notificationsTab,
    CustomIcons.profileTab,
  ];
  final _autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen
  /*late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> _fabAnimation;
  late Animation<double> _borderRadiusAnimation;
  late CurvedAnimation _fabCurve;
  late CurvedAnimation _borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;
*/
  get autoSizeGroup => _autoSizeGroup;

  @override
  void init() {
    /* _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: NavigatorState(),
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: NavigatorState(),
    );
    _fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    _borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    _fabAnimation = Tween<double>(begin: 0, end: 1).animate(_fabCurve);
    _borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      _borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: NavigatorState(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
*/
    super.init();
  }
  @override
  void dispose(){
    /* _fabAnimationController.dispose();
    _hideBottomBarAnimationController.dispose();
    _borderRadiusAnimationController.dispose();
   */ super.dispose();
  }

  get bottomNavIndex => _bottomNavIndex;

  set bottomNavIndex(value) {
    _bottomNavIndex = value;
    notifyListeners();
  }

/*  AnimationController get fabAnimationController => _fabAnimationController;

  AnimationController get borderRadiusAnimationController =>
      _borderRadiusAnimationController;

  Animation<double> get fabAnimation => _fabAnimation;

  Animation<double> get borderRadiusAnimation => _borderRadiusAnimation;

  CurvedAnimation get fabCurve => _fabCurve;

  CurvedAnimation get borderRadiusCurve => _borderRadiusCurve;

  AnimationController get hideBottomBarAnimationController =>
      _hideBottomBarAnimationController;*/

/* bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }
*/
}