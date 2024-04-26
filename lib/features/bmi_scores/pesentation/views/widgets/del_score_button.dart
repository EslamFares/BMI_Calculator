import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bmi/core/functions/show_snack.dart';
import 'package:bmi/core/widgets/ios_show_dialog.dart';
import 'package:bmi/core/widgets/small_icon_button.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DelScoreButton extends StatelessWidget {
  const DelScoreButton({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiScoresCubit, BmiScoresState>(
      listener: (BuildContext context, BmiScoresState state) {
        if (state is DeleteBmiSucces) {
          showSnack(context,
              contentType: ContentType.help, message: 'deleted successfully');
        }

        if (state is DeleteBmiFailure) {
          showSnack(context,
              contentType: ContentType.failure, message: state.message);
        }
      },
      builder: (context, state) {
        return SmallIconButton(
            icon: Icons.delete,
            color: Colors.red,
            onPressed: () {
              iosShowDialog(
                  context: context,
                  title: "Delete",
                  subTitle: "Delete?",
                  onConfirm: () => BmiScoresCubit.get(context).delScore(id));
            });
      },
    );
  }
}
