import 'package:bmi/core/functions/check_is_tablet.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../cubit/home_state.dart';

class BMICalSliders extends StatelessWidget {
  const BMICalSliders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: SizedBox(
                      height: isTablet(context) ? 250 : 125,
                      width: context.width - 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: SfSlider(
                              min: 30,
                              max: 280,
                              value: cubit.wightValue.toDouble(),
                              interval: 50,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (v) => cubit.changeWight(v),
                            ),
                          ),
                          Text('Wight : ${cubit.wightValue} kg',
                              style: AppTextStyles.font16BlackW500),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: isTablet(context) ? 250 : 125,
                      width: context.width - 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SfSlider(
                            min: 5,
                            max: 125,
                            value: cubit.ageValue.toDouble(),
                            interval: 20,
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (v) => cubit.changeAge(v),
                          ),
                          Text('age : ${cubit.ageValue} years',
                              style: AppTextStyles.font16BlackW500),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: SizedBox(
                height: isTablet(context) ? 500 : 260,
                width: 110,
                child: Column(
                  children: [
                    Expanded(
                      child: SfSlider.vertical(
                        min: 75,
                        max: 225,
                        value: cubit.heightValue.toDouble(),
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 2,
                        onChanged: (v) => cubit.changeHeight(v),
                      ),
                    ),
                    Text('Height\n${cubit.heightValue} cm',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font16BlackW500),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
