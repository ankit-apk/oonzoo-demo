import 'package:flutter/material.dart';
import 'package:pubmate_light/utils/sized_box.dart';

import '../../theme/colors.dart';
import '../../theme/textstyles.dart';

class SelectDeliveryAddress extends StatelessWidget {
  const SelectDeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        2.bw(),
        const Icon(
          Icons.map,
          color: AppColors.light,
        ),
        Text(
          " Deliver to ",
          style: AppTextStyles.bodyLight,
        ),
        Text(
          "Dubai",
          style: AppTextStyles.bodyDark,
        ),
        const Icon(
          Icons.arrow_downward,
          color: AppColors.bold,
        ),
      ],
    );
  }
}
