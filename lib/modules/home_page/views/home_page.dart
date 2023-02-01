import 'package:flutter/material.dart';
import 'package:pubmate_light/const/resource.dart';
import 'package:pubmate_light/theme/colors.dart';
import 'package:pubmate_light/theme/textstyles.dart';
import 'package:pubmate_light/utils/sized_box.dart';
import 'package:pubmate_light/utils/unfocus.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/home_page.dart/home_categories.dart';
import '../../../widgets/home_page.dart/home_header.dart';
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
                const HomeHeader(),
                4.bh(),
                const SelectDeliveryAddress(),
                3.bh(),
                Image.asset(R.ASSETS_IMAGES_ADS_PNG),
                Image.asset(R.ASSETS_IMAGES_CAROUSELAD_AVIF),
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

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(R.ASSETS_IMAGES_IPHONE_AVIF),
          ),
          Text(
            "Apple Iphone 14 Pro Max 256 GB Deep purple",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyDark,
          ),
          3.bh(),
          RichText(
            text: TextSpan(
              text: "AED ",
              style: AppTextStyles.bodyLight,
              children: [
                TextSpan(
                  text: "5129.00",
                  style: AppTextStyles.pricesDark,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Image.asset(R.ASSETS_IMAGES_EXPRESS_PNG),
              Chip(
                backgroundColor: AppColors.ratingsGreen,
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(horizontal: 1.6.w),
                side: BorderSide.none,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                label: Row(
                  children: [
                    Text(
                      "4.5",
                      style: AppTextStyles.ratingsLight,
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
              Text(
                "(120)",
                style: AppTextStyles.bodyLight,
              )
            ],
          )
        ],
      ),
    );
  }
}
