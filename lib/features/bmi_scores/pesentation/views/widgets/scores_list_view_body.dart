import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/scores_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/bmi_score_model.dart';

class ScoresListViewBody extends StatelessWidget {
  final List<DocumentSnapshot<Object?>> bmiDocs;
  const ScoresListViewBody({super.key, required this.bmiDocs});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiScoresCubit, BmiScoresState>(
      builder: (context, state) {
        BmiScoresCubit cubit = BmiScoresCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            controller: cubit.scrollController,
            trackVisibility: true,
            thumbVisibility: true,
            thickness: 5,
            child: ListView.builder(
              controller: cubit.scrollController,
              itemBuilder: (ctx, i) {
                Map<String, dynamic> bmiData =
                    bmiDocs[i].data() as Map<String, dynamic>;
                BmiScresModel model = BmiScresModel.fromMap(bmiData);
                return ScoresItem(model: model, id: bmiDocs[i].id);
              },
              itemCount: bmiDocs.length,
            ),
          ),
        );
      },
    );
  }
}
