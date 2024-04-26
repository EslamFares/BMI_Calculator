import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/bmi_scores_view.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_form.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_button_flutter/swipebutton.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                const BMICalForm(),
                verticalSpace(50),
                const BmiShape(),
                SwipeButton(
                  text: "Show BMI Scores",
                  backgroundColor: AppColors.blueDark,
                  swipeButtonColor: Colors.amber,
                  height: 56,
                  swipePercentageNeeded: .5,
                  onSwipeCallback: () => context.push(const BmiScoresView()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
