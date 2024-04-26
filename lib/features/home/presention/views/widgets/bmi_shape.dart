import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/home/cubit/home_cubit.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiShape extends StatelessWidget {
  const BmiShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return SizedBox(
            height: 250,
            width: context.width * .8,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
                GaugeRange(
                    label: "poor",
                    startValue: 0,
                    endValue: 10,
                    startWidth: 30,
                    endWidth: 30,
                    rangeOffset: -25,
                    color: Colors.amber),
                GaugeRange(
                    label: "Under Wight",
                    startValue: 10,
                    startWidth: 30,
                    endWidth: 30,
                    endValue: 18.5,
                    rangeOffset: -25,
                    color: Colors.yellow),
                GaugeRange(
                    label: "Normal",
                    startValue: 18.5,
                    endValue: 25,
                    startWidth: 30,
                    endWidth: 30,
                    rangeOffset: -25,
                    color: Colors.green),
                GaugeRange(
                    label: "Over Wight",
                    startValue: 25,
                    endValue: 30,
                    startWidth: 30,
                    endWidth: 30,
                    rangeOffset: -25,
                    color: Colors.orange),
                GaugeRange(
                    label: "Obese",
                    startValue: 30,
                    endValue: 50,
                    startWidth: 30,
                    endWidth: 30,
                    rangeOffset: -25,
                    color: Colors.red),
              ], pointers: <GaugePointer>[
                NeedlePointer(value: double.parse(cubit.bmiResult))
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: SizedBox(
                        child: Text(cubit.bmiResult,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ]));
      },
    );
  }
}
