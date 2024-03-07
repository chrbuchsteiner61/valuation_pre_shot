import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/main.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/numerical_formatter.dart';

class SingleValuation extends StatelessWidget {
  String strokeNumber = '1';
  final TextEditingController aController;
  final bool visibleElement;

  SingleValuation(
      {super.key,
      required strokeNumber,
      required this.aController,
      required this.visibleElement}) {
    this.strokeNumber = strokeNumber.toString();
  }

  StyledText textStroke = StyledText(
    aText: 'Schlag ',
    aWidth: 60,
    aLignment: 'left',
  );

  SizedBox aSpace = const SizedBox(width: 5);

  String convertStrokeNumberToTee(String strokeNumber) {
    int strokeOnATee = int.parse(strokeNumber) % numberOfStrokes;
    if (strokeOnATee == 0) { strokeOnATee = 10;}
    return strokeOnATee.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibleElement,
      child: Center(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          width: 140,
          height: 40,
          margin: const EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: <Widget>[
                textStroke,
                StyledText(
                  aText: convertStrokeNumberToTee(strokeNumber),
                  aWidth: 28,
                  aLignment: 'right',
                ),
                aSpace,
                SizedBox(
                  width: 38,
                  child: TextField(
                    controller: aController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      NumericalFormatter(min: 0, max: 6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
