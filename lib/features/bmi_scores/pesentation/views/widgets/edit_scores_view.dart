import 'package:bmi/core/utils/navigate_extensions.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/core/widgets/global_text_form.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:bmi/features/home/presention/views/widgets/bmi_cal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScoresView extends StatelessWidget {
  const EditScoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Scores'),
      ),
      body: BlocBuilder<BmiScoresCubit, BmiScoresState>(
        builder: (context, state) {
          BmiScoresCubit cubit = BmiScoresCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: cubit.formEditKey,
              child: Column(
                children: [
                  GlobalTextForm(
                    textController: cubit.heightEdit,
                    hintText: "180 cm ",
                    labelText: 'Height',
                    keyBordType: TextInputType.number,
                    moreValidation: () => validValue(cubit.heightEdit, 20, 250),
                    onchange: (v) => cubit.checkNewupdate(),
                  ),
                  GlobalTextForm(
                    textController: cubit.wightEdit,
                    hintText: "75 kg",
                    labelText: 'Wight',
                    keyBordType: TextInputType.number,
                    moreValidation: () => validValue(cubit.wightEdit, 1, 500),
                    onchange: (v) => cubit.checkNewupdate(),
                  ),
                  GlobalTextForm(
                    textController: cubit.ageEdit,
                    hintText: "22",
                    labelText: 'Age',
                    keyBordType: TextInputType.number,
                    moreValidation: () => validValue(cubit.ageEdit, 1, 120),
                    onchange: (v) => cubit.checkNewupdate(),
                  ),
                  verticalSpace(20),
                  CustomBtn(
                    onTap: () =>
                        cubit.updateScore().then((value) => context.pop()),
                    color: !cubit.haveUpdate ? Colors.grey : Colors.red,
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
