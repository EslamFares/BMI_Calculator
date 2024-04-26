import 'package:bmi/core/functions/get_data_pagenation.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';
import 'package:bmi/features/bmi_scores/repo/bmi_scores_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScoresCubit extends Cubit<BmiScoresState> {
  final BmiScoresRepo bmiScoresRepo;
  BmiScoresCubit(this.bmiScoresRepo) : super(BmiScoresInitial());
  static BmiScoresCubit get(context) => BlocProvider.of(context);
  //#=====================get PAgenation===================================
  final ScrollController scrollController = ScrollController();
  final GetDataPagenation bmiPagenation = GetDataPagenation(
      collectionName: 'bmi', dataLimit: 10, feildSortedBy: 'time');

  init() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              (scrollController.position.maxScrollExtent) &&
          !scrollController.position.outOfRange) {
        bmiPagenation.getBmi();
      }
    });
  }

  Stream<List<DocumentSnapshot>> listenToChatsRealTime() {
    bmiPagenation.getBmi();
    return bmiPagenation.bmiController.stream;
  }

  //#=====================delete============================================
  Future<void> delScore(id) async {
    emit(DeleteBmiLaoding());
    final res = await bmiScoresRepo.deleteBmiScore(id);
    res.fold((l) => emit(DeleteBmiFailure(l.message)),
        (r) => emit(DeleteBmiSucces()));
  }

  //#==============update======================================================
  TextEditingController heightEdit = TextEditingController();
  TextEditingController wightEdit = TextEditingController();
  TextEditingController ageEdit = TextEditingController();
  GlobalKey<FormState> formEditKey = GlobalKey();
  late BmiScresModel currentmodel;
  late String bmiScoreID;
  bool haveUpdate = false;

  fetchOldData(BmiScresModel model, String id) {
    currentmodel = model;
    bmiScoreID = id;
    heightEdit.text = model.height.toString();
    wightEdit.text = model.wight.toString();
    ageEdit.text = model.age.toString();
    haveUpdate = false;
    emit(BmiScoresOldDataState());
  }

  void checkNewupdate() {
    if (heightEdit.text != currentmodel.height.toString() ||
        wightEdit.text != currentmodel.wight.toString() ||
        ageEdit.text != currentmodel.age.toString()) {
      haveUpdate = true;
      emit(BmiScoresEditState());
    } else {
      haveUpdate = false;
      emit(BmiScoresEditState());
    }
  }

  Future<void> updateScore(context) async {
    if (haveUpdate && formEditKey.currentState!.validate()) {
      emit(BmiUpdateLoading());
      final res = await bmiScoresRepo.updateBmiScore(
          bmiScoreID,
          BmiScresModel(
              height: heightEdit.text,
              wight: wightEdit.text,
              age: ageEdit.text,
              bmi: calBmiUpdated().toString(),
              time: currentmodel.time));
      res.fold((l) => emit(BmiUpdateFailure(l.message)),
          (r) => emit(BmiUpdateSucces()));
    }
  }

  double calBmiUpdated() {
    return double.parse(wightEdit.text) /
        ((double.parse(heightEdit.text) / 100) *
            (double.parse(heightEdit.text) / 100));
  }

//------------------------------
  @override
  Future<void> close() async {
    scrollController.dispose();
    super.close();
  }
}
