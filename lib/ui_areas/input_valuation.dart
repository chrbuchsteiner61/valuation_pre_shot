import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/constants.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class InputValuation extends StatelessWidget {
  final List<String> strokeValuation;
  final List<TextEditingController> aValuationController;

  const InputValuation({
    super.key,
    required this.strokeValuation,
    required this.aValuationController,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> getStrokes(
      int aTee,
      List<String> aValuationOfStrokes,
    ) {
      List<Widget> inputTextFields = [];
      bool elementVisible = true;

      for (int i = 0; i < numberOfStrokes; i++) {
        if (i >= ((aTee - 1) * numberOfStrokesPerTee) &&
            (i < (aTee * numberOfStrokesPerTee))) {
          elementVisible = true;
        } else {
          elementVisible = false;
        }
        inputTextFields.add(
          SingleValuation(
            strokeNumber: i + 1,
            aController: aValuationController[i],
            visibleElement: elementVisible,
          ),
        );
      }
      return inputTextFields;
    }

    return Center(
      child: Column(
          children:
              getStrokes(context.watch<TeeProvider>().aTee, strokeValuation)),
    );
  }
}
