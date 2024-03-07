import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class InputValuation extends StatelessWidget {
  // final int tee;
  final List<String> strokeValuation;
  final List<TextEditingController> aValuationController;

  InputValuation({
    super.key,
    //  required this.tee,
    required this.strokeValuation,
    required this.aValuationController,
  });

  List<Widget> strokeTextFields = [];

  List<Widget> getStrokes(
    int aTee,
    List<String> aValuationOfStrokes,
  ) {
    List<Widget> inputTextFields = [];
    bool elementVisible = true;
    int numberOfInputs = numberOfStrokes * numberOfTees;
    logger.d('Veraendert? ${aTee}');
    for (int i = 0; i < numberOfInputs; i++) {
      if (i >= ((aTee -1) * numberOfStrokes) && (i < (aTee * numberOfStrokes))) {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children:
              getStrokes(context.watch<TeeProvider>().aTee, strokeValuation)),
      // ],
    );
  }
}
