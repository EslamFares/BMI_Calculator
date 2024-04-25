import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //======================
  TextEditingController height = TextEditingController();
  TextEditingController wight = TextEditingController();
  TextEditingController age = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  double dmi = 0;
  bmiCal() {
    if (formKey.currentState!.validate()) {
      dmi = double.parse(wight.text) /
          ((double.parse(height.text) / 100) *
              (double.parse(height.text) / 100));
      emit(BmiCalState());
    }
  }
}
