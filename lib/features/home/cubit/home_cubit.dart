import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //======================
  String bmiResult = "24.7";
  // --------------------
  int heightValue = 180;
  changeHeight(double value) {
    heightValue = value.toInt();
    emit(ChangeHeightState());
  }

  int wightValue = 80;
  changeWight(double value) {
    wightValue = value.toInt();
    emit(ChangeWightState());
  }

  int ageValue = 20;
  changeAge(double value) {
    ageValue = value.toInt();
    emit(ChangeAgeState());
  }

//--------------------------------------------------------
  calBMI() async {
    bmiResult = (wightValue / ((heightValue / 100) * (heightValue / 100)))
        .toStringAsFixed(2);
    emit(BmiCalState());
    await saveBMIinFireStore();
  }

  saveBMIinFireStore() async {
    emit(BmiSaveLoading());
    try {
      CollectionReference bmiCollection =
          FirebaseFirestore.instance.collection('bmi');
      await bmiCollection.add(BmiScresModel(
              height: heightValue.toString(),
              wight: wightValue.toString(),
              age: ageValue.toString(),
              bmi: bmiResult,
              time: DateTime.now().toString())
          .toMap());
      emit(BmiSaveSucess());
    } on Exception catch (e) {
      emit(BmiSaveFailure(e.toString()));
    }
  }
}
