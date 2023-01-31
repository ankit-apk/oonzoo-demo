import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/*
This extension is created
to make easy to put spaces 
between widgets in
rows and columns.
Use .bh to put height
User .bw to put width
between widgets.
*/
extension Box on num {
//----------------------------------
  SizedBox bh() {
    return SizedBox(
      height: this * 1.w,
    );
  }

//----------------------------------
  SizedBox bw() {
    return SizedBox(
      width: this * 1.w,
    );
  }
//----------------------------------
}
