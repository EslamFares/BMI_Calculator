import 'package:bmi/core/network/failure/failure.dart';
import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BmiScoresRepo {
  Future<Either<Failure, String>> updateBmiScore(
      String bmiScoreID, BmiScresModel model) async {
    try {
      final collection = FirebaseFirestore.instance.collection('bmi');
      await collection.doc(bmiScoreID).update(model.toMap());
      return const Right("Done updated");
    } on Exception catch (e) {
      return Left(Failure("can't updated data check connection /n $e"));
    }
  }

  Future<Either<Failure, String>> deleteBmiScore(String id) async {
    try {
      final collection = FirebaseFirestore.instance.collection('bmi');
      await collection.doc(id).delete();
      return right("Done deleted");
    } on Exception catch (e) {
      return Left(Failure("can't delete data check connection /n $e"));
    }
  }
}
