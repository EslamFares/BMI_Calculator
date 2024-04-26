import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi/core/functions/show_snack.dart';
import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/features/home/presention/views/home_view.dart';
import 'package:bmi/features/login/cubit/login_cubit.dart';
import 'package:bmi/features/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          context.pushAndRemoveUntil(const HomeView());
        }
        if (state is LoginFailure) {
          showSnack(context,
              contentType: ContentType.failure, message: state.message);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return CustomBtn(
          onTap: () => cubit.signIn(),
          cutmChild: state is LoginLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.white,
                ))
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.eyeSlash, color: AppColors.white),
                    Text("Sign In (anonymous)",
                        style: AppTextStyles.font22BoldWhite),
                  ],
                ),
        );
      },
    );
  }
}
