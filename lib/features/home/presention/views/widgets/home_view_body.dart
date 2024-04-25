import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Column(
            children: [
              const BMICalForm(),
              Text("Dmi : ${cubit.dmi.toStringAsFixed(2)}"),
            ],
          );
        },
      ),
    );
  }
}
