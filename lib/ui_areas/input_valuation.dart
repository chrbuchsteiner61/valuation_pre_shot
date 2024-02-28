import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';

import '../main.dart';

// import '../main.dart';

class InputValuation extends StatelessWidget {
  final int numberOfStrokes;
  final int tee;
  final ARow strokeValuation;
  final List<TextEditingController> aValuationController;

  InputValuation(
      {super.key,
      required this.numberOfStrokes,
      required this.tee,
      required this.strokeValuation,
      required this.aValuationController,
      });

  List<Widget> strokeTextFields = [];


  List<Widget> _getStrokes(
    int numberOfStrokes,
    ARow aValuationOfStrokes,
  ) {
    for (int i = 0; i < numberOfStrokes; i++) {
      strokeTextFields.addAll([
        SingleValuation(
            strokeNumber: i + 1, aController: aValuationController[i])
      ]);
    }
    return strokeTextFields;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: _getStrokes(numberOfStrokes, strokeValuation)),
      // ],
    );
  }
}
