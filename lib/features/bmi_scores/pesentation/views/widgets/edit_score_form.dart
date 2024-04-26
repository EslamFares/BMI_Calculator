import 'package:bmi/core/widgets/global_text_form.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_cubit.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScoreForm extends StatelessWidget {
  const EditScoreForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiScoresCubit, BmiScoresState>(
      builder: (context, state) {
        BmiScoresCubit cubit = BmiScoresCubit.get(context);
        return Form(
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
            ],
          ),
        );
      },
    );
  }
}

bool isNum(String num) {
  double? res = double.tryParse(num);
  return res != null;
}

validValue(TextEditingController crtl, int startValue, int endValue) {
  if (!isNum(crtl.text)) {
    return "enter num";
  } else {
    if (double.parse(crtl.text) < startValue ||
        double.parse(crtl.text) > endValue) {
      return 'from $startValue to $endValue';
    }
  }
  return null;
}
