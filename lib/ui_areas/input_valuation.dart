import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';

class InputValuation extends StatelessWidget {
  InputValuation({super.key});

  final int numberOfStrokes = 10;
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
    return Center(
      child: Column(children: _getStrokes(numberOfStrokes)),
      // ],
    );
  }
}
