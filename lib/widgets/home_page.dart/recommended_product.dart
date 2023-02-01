import 'package:flutter/material.dart';
import 'package:pubmate_light/utils/sized_box.dart';
import 'package:sizer/sizer.dart';

import '../../const/resource.dart';
import '../../theme/colors.dart';
import '../../theme/textstyles.dart';

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
            child: Image.asset(R.ASSETS_IMAGES_IPHONE_PNG),
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
