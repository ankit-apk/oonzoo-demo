import 'package:flutter/material.dart';
import 'package:pubmate_light/const/resource.dart';
import 'package:pubmate_light/theme/colors.dart';
import 'package:pubmate_light/theme/textstyles.dart';
import 'package:pubmate_light/utils/sized_box.dart';
import 'package:pubmate_light/utils/unfocus.dart';

import '../../../widgets/home_page.dart/home_categories.dart';
import '../../../widgets/home_page.dart/home_header.dart';
import '../../../widgets/home_page.dart/recommended_product.dart';
import '../../../widgets/home_page.dart/select_address.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                2.bh(),
                const HomeHeader(),
                4.bh(),
                const SelectDeliveryAddress(),
                3.bh(),
                Image.asset(R.ASSETS_IMAGES_ADS_PNG),
                Image.asset(R.ASSETS_IMAGES_CAROUSELAD_PNG),
                HomeCategories(),
                3.bh(),
                Text(" Recommended for you", style: AppTextStyles.headingDark),
                ColoredBox(
                  color: AppColors.homeRecommended,
                  child: AspectRatio(
                    aspectRatio: 5 / 5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      itemExtent: 200,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: RecommendedProduct(),
                        );
                      },
                    ),
                  ),
                ),
                3.bh(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
