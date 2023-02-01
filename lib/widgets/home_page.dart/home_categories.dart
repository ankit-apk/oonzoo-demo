import 'package:flutter/material.dart';

import '../../const/resource.dart';
import '../../theme/colors.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({
    super.key,
  });

  final List<String> categories = [
    R.ASSETS_IMAGES_BEAUTY_PNG,
    R.ASSETS_IMAGES_MOBILES_PNG,
    R.ASSETS_IMAGES_NOON_PNG,
    R.ASSETS_IMAGES_OFFERS_PNG,
    R.ASSETS_IMAGES_GAMING_PNG,
    R.ASSETS_IMAGES_WOMEN_PNG,
    R.ASSETS_IMAGES_LAPTOP_PNG,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.homeYellow,
      ),
      child: AspectRatio(
        aspectRatio: 16 / 11,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: List.generate(7, (index) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Image.asset(categories[index]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
