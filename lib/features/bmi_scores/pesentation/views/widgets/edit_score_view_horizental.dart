import 'package:bmi/core/utils/spacing_extensions.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditScoreViewHorizental extends StatelessWidget {
  const EditScoreViewHorizental({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: SingleChildScrollView(
        child: Row(
          children: [
            const Expanded(flex: 1, child: EditScoreForm()),
            horizontalSpace(20),
            const Expanded(flex: 1, child: EditScoreButton()),
          ],
        ),
      ),
    );
  }
}
