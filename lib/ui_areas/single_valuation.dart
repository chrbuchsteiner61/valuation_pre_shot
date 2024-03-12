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

  SizedBox aSpaceSmall = const SizedBox(width: 4);
  SizedBox aSpaceMiddle = const SizedBox(width: 12);

  String convertStrokeNumberToTee(String strokeNumber) {
    int strokeOnATee = int.parse(strokeNumber) % numberOfStrokes;
    if (strokeOnATee == 0) {
      strokeOnATee = 10;
    }
    return strokeOnATee.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibleElement,
      child: Center(
        child: Container(
          width: 150,
          height: 40,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: <Widget>[
                aSpaceSmall,
                textStroke,
                StyledText(
                  aText: convertStrokeNumberToTee(strokeNumber),
                  aWidth: 28,
                  aLignment: 'right',
                ),
                aSpaceMiddle,
                SizedBox(
                  width: 38,
                  child: TextField(
                    controller: aController,
                    decoration: InputDecoration(
                 //     border: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 2, 8, 3),
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
