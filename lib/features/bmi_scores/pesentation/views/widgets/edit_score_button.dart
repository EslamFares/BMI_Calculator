import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScoreButton extends StatelessWidget {
  const EditScoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiScoresCubit, BmiScoresState>(
      builder: (context, state) {
        BmiScoresCubit cubit = BmiScoresCubit.get(context);
        return CustomBtn(
          text: "Update",
          onTap: () => cubit.updateScore(context),
          color: !cubit.haveUpdate ? Colors.grey : Colors.red,
        );
      },
    );
  }
}
