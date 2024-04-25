import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //======================
  TextEditingController height = TextEditingController();
  TextEditingController wight = TextEditingController();
  TextEditingController age = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  double bmiResult = 0;
  calBMI() async {
    if (formKey.currentState!.validate()) {
      bmiResult = double.parse(wight.text) /
          ((double.parse(height.text) / 100) *
              (double.parse(height.text) / 100));
      emit(BmiCalState());
      await saveBMIinFireStore();
    }
  }

  saveBMIinFireStore() async {
    emit(BmiSaveLoading());
    try {
      CollectionReference bmiCollection =
          FirebaseFirestore.instance.collection('bmi');
      await bmiCollection.add(BmiScresModel(
              height: height.text,
              wight: wight.text,
              age: age.text,
              bmi: bmiResult.toString(),
              time: DateTime.now().toString())
          .toMap());
      emit(BmiSaveSucess());
    } on Exception catch (e) {
      debugPrint('error in savvvvvvvvvvvve: $e');
      emit(BmiSaveFailure(e.toString()));
    }
  }
}
