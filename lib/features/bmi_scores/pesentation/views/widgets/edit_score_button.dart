import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi/core/functions/show_snack.dart';
import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
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
    return BlocConsumer<BmiScoresCubit, BmiScoresState>(
      listener: (BuildContext context, BmiScoresState state) {
        if (state is BmiUpdateSucces) {
          Navigator.pop(context);
          showSnack(context,
              contentType: ContentType.success,
              message: 'updated successfully');
        }
      },
      builder: (context, state) {
        BmiScoresCubit cubit = BmiScoresCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: CustomBtn(
            cutmChild: state is BmiUpdateLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.white,
                  ))
                : const Text(
                    "Update",
                    style: AppTextStyles.font22BoldWhite,
                  ),
            onTap: () => cubit.updateScore(context),
            color: !cubit.haveUpdate ? Colors.grey : Colors.red,
          ),
        );
      },
    );
  }
}
