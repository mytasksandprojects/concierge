import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:concierge/Pages/Home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../Style/custom_colors.dart';
import '../../Style/custom_icons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeViewModel>(
      view: () => const _HomeView(),
      viewModel: HomeViewModel(),
    );
  }
}

class _HomeView extends HookView<HomeViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _HomeView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return ListView(
      children: [
        if(vmodel.banners.isNotEmpty)
        Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: PageView(
                children:[Image.network(vmodel.banners[vmodel.pageIndex].image??'',fit: BoxFit.fill,)],
                onPageChanged: (index) {
                  //  pageIndex = index;
                  vmodel.pageIndex=index;
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CarouselIndicator(
              count: vmodel.banners.length,
              index: vmodel.pageIndex,
            ),
          ],
        ),
      ],
    );
  }
}
