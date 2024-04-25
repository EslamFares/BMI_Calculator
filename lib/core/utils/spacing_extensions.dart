import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

//==================
SizedBox verticalSpace(double height) => SizedBox(height: height);
SizedBox horizontalSpace(double width) => SizedBox(width: width);
