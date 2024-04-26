import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/del_score_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_item_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/score_data_element.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          height: 135,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.calculator,
                        color: AppColors.blue,
                      ),
                      const Text(
                        'BMI : ',
                        style: AppTextStyles.font22BuleW900,
                      ),
                      Text(
                        " ${model.bmi}  kg/m2",
                        style:
                            AppTextStyles.font22BuleW900.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      EditScoreItemButton(model: model, id: id),
                      DelScoreButton(id: id),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScoreDataElement(
                          icon: FontAwesomeIcons.textHeight,
                          text: 'Height : ${model.height}cm '),
                      ScoreDataElement(
                          icon: FontAwesomeIcons.userAstronaut,
                          text: 'age : ${model.age} years'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScoreDataElement(
                          icon: FontAwesomeIcons.weightScale,
                          text: "weight: ${model.wight} kg"),
                      ScoreDataElement(
                          icon: FontAwesomeIcons.calendarPlus,
                          textStyle: AppTextStyles.font12GrayW400,
                          text: model.time),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
