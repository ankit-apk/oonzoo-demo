import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../const/resource.dart';
import '../../theme/textstyles.dart';
import '../search_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          R.ASSETS_IMAGES_IMAGES_PNG,
          height: 10.w,
          width: 10.w,
          fit: BoxFit.fill,
          cacheHeight: 80,
          cacheWidth: 80,
        ),
        Text(
          "noon",
          style: AppTextStyles.headingDark,
        ),
        SizedBox(
          width: 5.w,
        ),
        const Expanded(child: ModernSearchBar()),
        SizedBox(
          width: 2.w,
        ),
      ],
    );
  }
}
