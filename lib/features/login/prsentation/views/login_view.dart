import 'package:bmi/features/login/cubit/login_cubit.dart';
import 'package:bmi/features/login/prsentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/login_view_body_horizontal.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const LoginViewBody()
              : const LoginViewBodyHorizontal();
        }),
      ),
    );
  }
}
