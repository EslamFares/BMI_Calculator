import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';
import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:bmi/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

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
    final res = await homeRepo.addBmiScore(BmiScresModel(
        height: heightValue.toString(),
        wight: wightValue.toString(),
        age: ageValue.toString(),
        bmi: bmiResult,
        time: DateTime.now().toString()));
    res.fold((l) => BmiSaveFailure(l.message), (r) => emit(BmiSaveSucess()));
    // try {
    //   CollectionReference bmiCollection =
    //       FirebaseFirestore.instance.collection('bmi');
    //   await bmiCollection.add(
    // BmiScresModel(
    //           height: heightValue.toString(),
    //           wight: wightValue.toString(),
    //           age: ageValue.toString(),
    //           bmi: bmiResult,
    //           time: DateTime.now().toString())
    //       .toMap());
    //   emit(BmiSaveSucess());
    // } on Exception catch (e) {
    //   emit(BmiSaveFailure("can't save data check connection /n $e"));
    // }
  }
}
