import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/widgets/ios_show_dialog.dart';
import 'package:bmi/core/widgets/small_icon_button.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_scores_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/bmi_score_model.dart';

class EditScoreButton extends StatelessWidget {
  const EditScoreButton({
    super.key,
    required this.model,
    required this.id,
  });

  final BmiScresModel model;
  final String id;

  @override
  Widget build(BuildContext context) {
    return SmallIconButton(
        icon: Icons.edit,
        color: Colors.green,
        onPressed: () {
          iosShowDialog(
              context: context,
              title: "edit",
              subTitle: "edit",
              onConfirm: () => context.push(BlocProvider.value(
                    value: context.read<BmiScoresCubit>()
                      ..fetchOldData(model, id),
                    child: const EditScoresView(),
                  )));
        });
  }
}
