import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/numerical_formatter.dart';

class SingleValuation extends StatelessWidget {
  String strokeNumber = '1';
  final TextEditingController aFunction;

  SingleValuation({super.key, required strokeNumber, required this.aFunction}) {
    this.strokeNumber = strokeNumber.toString();
  }

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
              StyledText(
                aText: 'Schlag ',
                aWidth: 60,
                aLignment: 'left',
              ),
              StyledText(
                aText: strokeNumber,
                aWidth: 28,
                aLignment: 'right',
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 38,
                child: TextField(
                  controller: aFunction,
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
