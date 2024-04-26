import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/features/bmi_scores/model/bmi_score_model.dart';

import 'package:bmi/features/bmi_scores/pesentation/views/widgets/score_data_element.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> scoreItemBodyChildern(BmiScresModel model) => [
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
    ];
