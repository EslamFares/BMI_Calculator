import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/core/widgets/custom_btn.dart';
import 'package:bmi/core/widgets/global_text_form.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/home_state.dart';

class BMICalForm extends StatelessWidget {
  const BMICalForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              GlobalTextForm(
                  textController: cubit.height,
                  hintText: "180 cm ",
                  labelText: 'Height',
                  keyBordType: TextInputType.number,
                  moreValidation: () => validValue(cubit.height, 20, 250)),
              GlobalTextForm(
                textController: cubit.wight,
                hintText: "75 kg",
                labelText: 'Wight',
                keyBordType: TextInputType.number,
                moreValidation: () => validValue(cubit.wight, 1, 500),
              ),
              GlobalTextForm(
                textController: cubit.age,
                hintText: "22",
                labelText: 'Age',
                keyBordType: TextInputType.number,
                moreValidation: () => validValue(cubit.age, 1, 120),
              ),
              verticalSpace(20),
              CustomBtn(
                onTap: () {
                  cubit.bmiCal();
                },
                text: 'BMI Calculator',
              ),
              verticalSpace(20),
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
      return 'enter value from $startValue to $endValue';
    }
  }
  return null;
}