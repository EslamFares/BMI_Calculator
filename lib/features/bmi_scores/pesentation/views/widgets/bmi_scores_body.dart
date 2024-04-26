import 'package:bmi/core/functions/show_snack.dart';
import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/core/widgets/global_text_form.dart';
import 'package:bmi/core/widgets/ios_show_dialog.dart';
import 'package:bmi/core/widgets/small_icon_button.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_scores_view.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/bmi_score_model.dart';

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
                  debugPrint('bmiSnapshot: ${bmiSnapshot.data?.length}');
                  final bmiDocs = bmiSnapshot.data!;
                  return Scrollbar(
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
                        debugPrint('bmiData: ${bmiData.length}');

                        return Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            height: context.height / 10.66,
                            color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SmallIconButton(
                                    icon: Icons.edit,
                                    onPressed: () {
                                      iosShowDialog(
                                          context: context,
                                          title: "edit",
                                          subTitle: "edit",
                                          onConfirm: () =>
                                              context.push(BlocProvider.value(
                                                value: context
                                                    .read<BmiScoresCubit>()
                                                  ..fetchOldData(
                                                      model, bmiDocs[i].id),
                                                child: const EditScoresView(),
                                              )));
                                    }),
                                Text(model.height),
                                Text(model.wight),
                                Text(model.time.toString()),
                                SmallIconButton(
                                    icon: Icons.delete,
                                    onPressed: () {
                                      iosShowDialog(
                                          context: context,
                                          title: "Delete",
                                          subTitle: "Delete?",
                                          onConfirm: () =>
                                              cubit.delScore(bmiDocs[i].id));
                                    }),
                              ],
                            ));
                      },
                      itemCount: bmiDocs.length,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              }
            });
      },
    );
  }
}
