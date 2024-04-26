import 'package:bmi/core/cash/getstorage_helper.dart';
import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_constants.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/widgets/ios_show_dialog.dart';
import 'package:bmi/core/widgets/small_icon_button.dart';
import 'package:bmi/features/login/prsentation/views/login_view.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          const Text('BMI Calulator', style: AppTextStyles.font25BuleDarkW500),
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
                GetStorageHelper.writeData(AppConsts.isLogined, false);
                context.pushAndRemoveUntil(const LoginView());
              },
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
