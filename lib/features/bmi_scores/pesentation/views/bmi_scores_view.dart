import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/bmi_scores_body.dart';

class BmiScoresView extends StatelessWidget {
  const BmiScoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiScoresCubit()..init(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('BMI Scores'),
          ),
          body: const BmiScoresBody()),
    );
  }
}
