import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_button.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditScoreViewBody extends StatelessWidget {
  const EditScoreViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditScoreForm(),
            EditScoreButton(),
          ],
        ),
      ),
    );
  }
}
