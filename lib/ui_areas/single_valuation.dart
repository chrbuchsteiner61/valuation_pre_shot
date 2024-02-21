import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/numerical_formatter.dart';

import '../main.dart';

class SingleValuation extends StatelessWidget {
  String strokeNumber = '1';
  final TextEditingController aController;

  SingleValuation({super.key, required strokeNumber, required this.aController}) {
    this.strokeNumber = strokeNumber.toString();
  }

  StyledText textStroke = StyledText(
    aText: 'Schlag ',
    aWidth: 60,
    aLignment: 'left',
  );

  SizedBox aSpace = const SizedBox(width: 5);

  @override
  Widget build(BuildContext context) {

    return Center(
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
                aText: strokeNumber,
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
    );
  }
}
