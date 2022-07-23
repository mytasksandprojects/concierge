import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:concierge/Pages/Home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../Style/custom_colors.dart';
import '../../Style/custom_icons.dart';
import 'main_view_model.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeViewModel>(
      view: () => const _MainView(),
      viewModel: HomeViewModel(),
    );
  }
}

class _MainView extends HookView<MainViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _MainView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 12),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 13,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: CustomColors.mainColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                  gradient: CustomColors.mainGradient,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: CustomColors.mainColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  Image.asset(
                    'assets/images/concierge-app-icon.png',
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [

                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      extendBody: true,
      backgroundColor: Colors.black,//Color(0xff050505).withOpacity(0.11),
      body: vmodel.views[vmodel.bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        //clipBehavior: Clip.none,
        backgroundColor: Colors.black,
        elevation: 0.0,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/askCircle.png'),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                    right: MediaQuery.of(context).size.width / 8.5,
                    top: 5,
                    child: Center(
                        child: Icon(
                      CustomIcons.path_142,
                      size: 30,
                      color: Colors.black,
                    ))),
                Center(
                    child: Text(
                  'ASK',
                  style: TextStyle(color: Colors.black),
                )),
              ],
            ),
          ),
        ),
        onPressed: () {
          /* vmodel.fabAnimationController.reset();
          vmodel.borderRadiusAnimationController.reset();
          vmodel.borderRadiusAnimationController.forward();
          vmodel.fabAnimationController.forward();*/
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: vmodel.views.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0xffD8AB4D) : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                vmodel.tabsIcons?[index], //notifications icon
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  vmodel.tabsTitles?[index] ?? '',
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: vmodel.autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.black,
        activeIndex: vmodel.bottomNavIndex,
        splashColor: CustomColors.mainColor,
        // notchAndCornersAnimation: vmodel.borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => vmodel.bottomNavIndex = index,
        //  hideAnimationController: vmodel.hideBottomBarAnimationController,
      ),
    );
  }
}
