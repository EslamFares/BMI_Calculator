import 'package:bmi/core/functions/get_data_pagenation.dart';
import 'package:bmi/features/bmi_scores/cubit/bmi_scores_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScoresCubit extends Cubit<BmiScoresState> {
  BmiScoresCubit() : super(BmiScoresInitial());
  static BmiScoresCubit get(context) => BlocProvider.of(context);
  //==================================
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

  //=====================del==============
  Future<void> delScore(id) async {
    final collection = FirebaseFirestore.instance.collection('bmi');
    collection.doc(id).delete();
  }

  //==============update================
  Future<void> updateScore(id, Map<String, String> data) async {
    final collection = FirebaseFirestore.instance.collection('bmi');
    collection.doc(id).update(data);
  }

//------------------------------
  @override
  Future<void> close() async {
    scrollController.dispose();
    super.close();
  }
}
