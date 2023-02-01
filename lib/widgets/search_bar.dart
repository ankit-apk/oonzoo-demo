import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/colors.dart';
import '../theme/textstyles.dart';

class ModernSearchBar extends StatelessWidget {
  const ModernSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: TextField(
                cursorColor: AppColors.light,
                cursorWidth: 1,
                cursorHeight: 12,
                decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  border: InputBorder.none,
                  hintStyle: AppTextStyles.bodyLight,
                ),
              ),
            ),
            const Expanded(
              child: Icon(
                Icons.search,
                color: AppColors.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
