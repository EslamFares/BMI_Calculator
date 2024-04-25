import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle font22Bold =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  //========= 16============
  static const TextStyle font16BlackW500 = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  //==============22================
  static const TextStyle font22BuleDarkW500 = TextStyle(
    fontSize: 22,
    color: AppColors.blueDark,
    fontWeight: FontWeight.w500,
  );
}