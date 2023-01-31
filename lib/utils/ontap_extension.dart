import 'package:flutter/material.dart';

/*
This extension is created to reduce
boilerplate of wrapping widgets with gesturedetectors
To use this add ".onTap" and pass the function as param
*/
extension OnTap on Widget {
  GestureDetector onTap(onTapAction) {
    return GestureDetector(
      onTap: onTapAction,
      child: this,
    );
  }
}
