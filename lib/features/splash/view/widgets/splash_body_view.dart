import 'package:bmi/core/utils/app_assets.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';

class SplashBodyView extends StatelessWidget {
  const SplashBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: orientation == Orientation.portrait ? 50 : 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceHorizontal(context.width),
            spaceExpanded(),
            SizedBox(
                height: orientation == Orientation.portrait ? 250 : 200,
                width: context.width * .5,
                child: Image.asset(AppAssets.icon)),
            spaceExpanded(),
            DefaultTextStyle(
              style: AppTextStyles.font22BuleW900,
              child: AnimatedTextKit(
                animatedTexts: [WavyAnimatedText('BMI Calculator')],
                isRepeatingAnimation: true,
              ),
            ),
          ],
        ),
      );
    });
  }
}
