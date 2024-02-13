import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';

import '../main.dart';

class InputValuation extends StatelessWidget {
  final int numberOfStrokes;
  final int tee;
  InputValuation({super.key, required this.numberOfStrokes, required this.tee});

  List<Widget> strokeTextFields = [];
  List<TextEditingController> aValuationController = [];

  List<Widget> _getStrokes(
    int numberOfStrokes,
  ) {
    for (int i = 0; i < numberOfStrokes; i++) {
      aValuationController.add(TextEditingController());
    }
    for (int i = 0; i < numberOfStrokes; i++) {
      strokeTextFields.addAll([
        SingleValuation(strokeNumber: i + 1, aFunction: aValuationController[i])
      ]);
    }
    return strokeTextFields;
  }

  @override
  Widget build(BuildContext context) {
    logger.d(tee);
    return Center(
      child: Column(children: _getStrokes(numberOfStrokes)),
      // ],
    );
  }
}
