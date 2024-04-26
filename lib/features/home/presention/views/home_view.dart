import 'package:bmi/core/functions/show_snack.dart';
import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/widgets/ios_show_dialog.dart';
import 'package:bmi/core/widgets/small_icon_button.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/login/prsentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calulator',
              style: AppTextStyles.font25BuleDarkW500),
          centerTitle: true,
          backgroundColor: AppColors.white,
          actions: [
            SmallIconButton(
              icon: Icons.logout,
              color: AppColors.gray,
              onPressed: () {
                iosShowDialog(
                  context: context,
                  title: 'Log Out',
                  subTitle: "Are you sure?",
                  onConfirm: () {
                    context.pushAndRemoveUntil(const LoginView());
                  },
                );
              },
            )
          ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
