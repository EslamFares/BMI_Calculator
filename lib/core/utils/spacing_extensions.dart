import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

//==================
SizedBox spaceVertical(double height) => SizedBox(height: height);
SizedBox spaceHorizontal(double width) => SizedBox(width: width);
Widget spaceExpanded() => const Expanded(child: SizedBox());
