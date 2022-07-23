import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:concierge/Pages/Home/home_view_model.dart';
import 'package:concierge/Widgets/category_card.dart';
import 'package:concierge/Widgets/circle_shape.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
        if (vmodel.banners.isNotEmpty)
          Column(
            children: [
              vmodel.banners.isNotEmpty
                  ? CarouselSlider.builder(
                      carouselController: vmodel.carouselController,
                      itemCount: vmodel.banners.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Image.network(
                          vmodel.banners[itemIndex].image ?? '',
                          fit: BoxFit.fill,
                        );
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          //autoPlay: true,
                          aspectRatio: 2.5,
                          onPageChanged: (index, reason) {
                            vmodel.pageIndex = index;
                          }),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              vmodel.banners.isNotEmpty
                  ? new DotsIndicator(
                      decorator: DotsDecorator(
                          activeColor: CustomColors.mainColor,
                          shape: CircleBorder(),
                          color: CustomColors.cardBackGround),
                      dotsCount: vmodel.banners.length,
                      position: vmodel.pageIndex.toDouble(),
                      onTap: (i) {
                        vmodel.pageIndex = i.toInt();
                        vmodel.carouselController.animateToPage(i.toInt());
                      },
                    )
                  : Container()
            ],
          ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Our Services',
            style: TextStyle(
                color: Color(0xffD8AB4D),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: vmodel.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return CategoryCard(categoryModel: vmodel.categories[index]);
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Promotions',
            style: TextStyle(
                color: Color(0xffD8AB4D),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 140,
            child: ListView.builder(
              itemCount: vmodel.promotions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                                vmodel.promotions[index].image ?? ''),
                            fit: BoxFit.fill))),
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}
