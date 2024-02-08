import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';

class InputValuation extends StatelessWidget {
  InputValuation({super.key});

  final int numberOfStrokes = 10;
  List<Widget> strokeTextFields = [];
  TextEditingController aValuationController = TextEditingController();

  List<Widget> _getStrokes(
    int numberOfStrokes,
  ) {
    for (int i = 0; i < numberOfStrokes; i++) {
      strokeTextFields.addAll([
        SingleValuation(strokeNumber: i + 1, aFunction: aValuationController)
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

//<Widget>[
/**
    SingleValuation(strokeNumber: 1),
    SingleValuation(strokeNumber: 2),
    SingleValuation(strokeNumber: 3),
    SingleValuation(strokeNumber: 4),
    SingleValuation(strokeNumber: 5),
    SingleValuation(strokeNumber: 6),
    SingleValuation(strokeNumber: 7),
    SingleValuation(strokeNumber: 8),
    SingleValuation(strokeNumber: 9),
    SingleValuation(strokeNumber: 10),
 **/
