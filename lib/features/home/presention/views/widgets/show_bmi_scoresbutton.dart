import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/bmi_scores_view.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_flutter/swipebutton.dart';

class ShowBmiScoresbutton extends StatelessWidget {
  const ShowBmiScoresbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwipeButton(
      text: "Show BMI Scores",
      backgroundColor: AppColors.blueDark,
      swipeButtonColor: Colors.amber,
      height: 56,
      swipePercentageNeeded: .5,
      onSwipeCallback: () => context.push(const BmiScoresView()),
    );
  }
}
