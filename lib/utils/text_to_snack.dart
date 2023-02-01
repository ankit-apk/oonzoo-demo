import 'package:flutter/material.dart';
import 'package:pubmate_light/theme/colors.dart';
import 'package:pubmate_light/theme/textstyles.dart';

extension TextToSnack on String {
  void textToSnack(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(this, style: AppTextStyles.errorText),
      backgroundColor: AppColors.errors,
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
