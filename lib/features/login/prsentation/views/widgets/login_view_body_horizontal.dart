import 'package:bmi/core/utils/app_assets.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/login/prsentation/views/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

class LoginViewBodyHorizontal extends StatelessWidget {
  const LoginViewBodyHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: context.width * .4,
            height: 250,
            child: Image.asset(AppAssets.icon)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('BMI Calculator',
                style: AppTextStyles.font25BuleDarkW500),
            SizedBox(width: context.width * .4, child: const SignInButton()),
          ],
        )
      ],
    );
  }
}
