import 'package:bmi/features/bmi_scores/pesentation/views/widgets/del_score_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_button.dart';
import 'package:flutter/material.dart';
import '../../../model/bmi_score_model.dart';

class ScoresItem extends StatelessWidget {
  final BmiScresModel model;
  final String id;

  const ScoresItem({super.key, required this.model, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(model.height),
                  Text(model.wight),
                  Text(model.age),
                  Text(model.bmi),
                  Text(model.time.toString()),
                ],
              ),
              Row(
                children: [
                  EditScoreButton(model: model, id: id),
                  DelScoreButton(id: id),
                ],
              ),
            ],
          )),
    );
  }
}
