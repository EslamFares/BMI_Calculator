import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/bmi_scores_view.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_button.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_sliders.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_shape.dart';
import 'package:bmi/features/home/presention/views/widgets/show_bmi_scoresbutton.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              spaceVertical(20),
              // const BMICalForm(),
              const BMICalSliders(),
              const BmiCalButton(),
              const BmiShape(),
              const ShowBmiScoresbutton(),
            ],
          ),
        ));
  }
}
