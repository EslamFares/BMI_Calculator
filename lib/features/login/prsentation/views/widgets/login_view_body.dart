import 'package:bmi/core/utils/app_assets.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/login/prsentation/views/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        spaceHorizontal(context.width),
        SizedBox(
            width: context.width * .8,
            height: 250,
            child: Image.asset(AppAssets.icon)),
        const Text('BMI Calculator', style: AppTextStyles.font25BuleDarkW500),
        spaceVertical(100),
        const SignInButton()
      ],
    );
  }
}
