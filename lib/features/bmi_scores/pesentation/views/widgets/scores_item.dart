import 'package:bmi/core/functions/check_is_tablet.dart';
import 'package:bmi/core/utils/app_colors.dart';
import 'package:bmi/core/utils/app_text_styles.dart';
import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/del_score_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_item_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/score_item_body_childern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../model/bmi_score_model.dart';

class ScoresItem extends StatelessWidget {
  final BmiScresModel model;
  final String id;

  const ScoresItem({super.key, required this.model, required this.id});

  @override
  Widget build(BuildContext context) {
    debugPrint("width:::::::::${context.width}");
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: context.width > 340 || isTablet(context) ? 135 : 160,
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
                      Text(
                        'BMI : ',
                        style: AppTextStyles.font22BuleW900.copyWith(
                            fontSize: context.width > 340 || isTablet(context)
                                ? 22
                                : 16),
                      ),
                      Text(
                        " ${model.bmi}  kg/m2",
                        style: AppTextStyles.font22BuleW900.copyWith(
                            fontSize: context.width > 340 || isTablet(context)
                                ? 18
                                : 14),
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
              context.width > 340 || isTablet(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: scoreItemBodyChildern(model),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: scoreItemBodyChildern(model),
                    )
            ],
          )),
    );
  }
}
