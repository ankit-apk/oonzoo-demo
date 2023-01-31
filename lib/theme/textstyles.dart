import 'package:flutter/material.dart';
import 'package:pubmate_light/theme/colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  AppTextStyles._();
  /*
  This class contains all the text style used in the app.
  Any future changes in textstyle can be performed from here. 
  */

  static final TextStyle headingLight = TextStyle(
    color: AppColors.medium,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  //---------------------------------------------------
  static final TextStyle headingDark = TextStyle(
    color: AppColors.bold,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  //---------------------------------------------------
  static final TextStyle bodyLight = TextStyle(
    color: AppColors.light,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  //---------------------------------------------------
  static final TextStyle textfieldHeader = TextStyle(
    color: AppColors.medium,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  //---------------------------------------------------
  static final TextStyle linkText = TextStyle(
    color: AppColors.link,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  //---------------------------------------------------
  static final TextStyle linkTextBold = TextStyle(
    color: AppColors.link,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  //---------------------------------------------------
}
