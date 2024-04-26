import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:flutter/material.dart';

class ScoreDataElement extends StatelessWidget {
  const ScoreDataElement({
    super.key,
    required this.text,
    required this.icon,
    this.textStyle,
  });

  final String text;
  final IconData icon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.blueDark, size: 20),
        horizontalSpace(8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ?? AppTextStyles.font16BlackW500,
        ),
      ],
    );
  }
}
