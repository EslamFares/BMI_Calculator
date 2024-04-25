import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
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
          title: const Text('BMI Calulator'),
          backgroundColor: AppColors.blue,
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
