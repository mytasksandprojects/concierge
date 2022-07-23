import 'package:concierge/Models/Category.dart';
import 'package:concierge/Style/custom_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.categoryModel}) : super(key: key);
  final CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(this.categoryModel?.image ?? ''),
                  fit: BoxFit.fill)),
        ),
        Container(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              this.categoryModel?.title ?? '',
              style: TextStyle(color: CustomColors.mainColor,fontSize: 14,fontWeight: FontWeight.bold),
            )))
      ],
    );
  }
}
