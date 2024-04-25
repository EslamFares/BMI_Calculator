import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/bmi_scores_view.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                Text("Dmi : ${cubit.bmiResult.toStringAsFixed(2)}"),
                // const Expanded(child: BmiStream()),
                CustomBtn(
                  onTap: () => context.push(const BmiScoresView()),
                  text: "BMI Scores",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
