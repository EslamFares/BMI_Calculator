import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_view_body.dart';
import 'package:bmi/features/bmi_scores/pesentation/views/widgets/edit_score_view_horizental.dart';
import 'package:flutter/material.dart';

class EditScoresView extends StatelessWidget {
  const EditScoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Scores')),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const EditScoreViewBody()
              : const EditScoreViewHorizental();
        }));
  }
}
