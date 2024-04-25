import 'package:bmi/features/home/cubit/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      await bmiCollection.add({
        'height': height.text,
        'wight': wight.text,
        'age': age.text,
        'bmi': bmiResult.toStringAsFixed(2),
        'time': DateTime.now().toString(),
        // 'userCredential': FirebaseAuth.instance.currentUser!.uid
      });
      emit(BmiSaveSucess());
    } on Exception catch (e) {
      debugPrint('error in savvvvvvvvvvvve: $e');
      emit(BmiSaveFailure(e.toString()));
    }
  }

  getBmiSavedData() {
    emit(GetBmiSavedDataLoading());
    try {
      final Stream<QuerySnapshot> bmiStream =
          FirebaseFirestore.instance.collection('bmi').snapshots();

      emit(GetBmiSavedDataSucess());
    } on Exception catch (e) {
      debugPrint('error in geeeeeeeeet: $e');
      emit(GetBmiSavedDataFailure(e.toString()));
    }
  }
}
