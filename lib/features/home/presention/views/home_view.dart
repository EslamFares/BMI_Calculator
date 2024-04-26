import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/home/presention/views/widgets/home_app_bar.dart';
import 'package:bmi/features/home/presention/views/widgets/home_view_body_horizantal.dart';
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
        appBar: const HomeAppBar(),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const HomeViewBody()
              : const HomeViewBodyHorizantal();
        }),
      ),
    );
  }
}
