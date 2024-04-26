import 'package:bmi/core/network/failure/failure.dart';
import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  Future<Either<Failure, String>> addBmiScore(BmiScresModel model) async {
    try {
      CollectionReference bmiCollection =
          FirebaseFirestore.instance.collection('bmi');
      await bmiCollection.add(model.toMap());
      return const Right("Done added");
    } on Exception catch (e) {
      return Left(Failure("can't save data check connection /n $e"));
    }
  }
}
