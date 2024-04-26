import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/features/home/presention/views/home_view.dart';
import 'package:bmi/features/login/prsentation/views/login_view.dart';
import 'package:bmi/features/splash/controller/check_is_user_login_before.dart';
import 'package:bmi/features/splash/view/widgets/splash_body_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isFirstTime = checkIsUserLoginBefore();
    Future.delayed(
        const Duration(seconds: 2),
        () => context.pushAndRemoveUntil(
            isFirstTime ? const LoginView() : const HomeView()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBodyView(),
    );
  }
}
