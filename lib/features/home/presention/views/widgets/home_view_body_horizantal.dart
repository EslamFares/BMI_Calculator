import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_button.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_sliders.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_shape.dart';
import 'package:bmi/features/home/presention/views/widgets/show_bmi_scoresbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBodyHorizantal extends StatelessWidget {
  const HomeViewBodyHorizantal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              spaceVertical(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          width: context.width * .35,
                          height: 220,
                          child: const BmiShape()),
                      SizedBox(
                          width: context.width * .3,
                          child: const BmiCalButton()),
                    ],
                  ),
                  const Expanded(child: BMICalSliders()),
                ],
              ),
              SizedBox(
                  width: context.width * .7,
                  child: const ShowBmiScoresbutton()),
              spaceVertical(30),
            ],
          ),
        ));
  }
}
