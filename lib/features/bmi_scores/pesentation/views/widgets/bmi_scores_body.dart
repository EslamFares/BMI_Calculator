import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scores_list_view_body.dart';

class BmiScoresBody extends StatelessWidget {
  const BmiScoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiScoresCubit, BmiScoresState>(
      builder: (context, state) {
        BmiScoresCubit cubit = BmiScoresCubit.get(context);
        return StreamBuilder<List<DocumentSnapshot>>(
            stream: cubit.listenToChatsRealTime(),
            builder: (ctx, bmiSnapshot) {
              if (bmiSnapshot.connectionState == ConnectionState.waiting ||
                  bmiSnapshot.connectionState == ConnectionState.none) {
                return bmiSnapshot.hasData
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Center(
                        child: Text("adding new score"),
                      );
              } else {
                if (bmiSnapshot.hasData) {
                  final bmiDocs = bmiSnapshot.data!;
                  return ScoresListViewBody(bmiDocs: bmiDocs);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  );
                }
              }
            });
      },
    );
  }
}
