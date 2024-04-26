import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi/core/functions/show_snack.dart';
import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/home_cubit.dart';
import '../../../cubit/home_state.dart';

class BmiCalButton extends StatelessWidget {
  const BmiCalButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is BmiSaveFailure) {
          showSnack(context,
              contentType: ContentType.failure, message: state.error);
        }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: CustomBtn(
              onTap: () {
                cubit.calBMI();
              },
              cutmChild: state is BmiSaveLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.white,
                    ))
                  : const Text(
                      "BMI Calculator",
                      style: AppTextStyles.font22BoldWhite,
                    )),
        );
      },
    );
  }
}
