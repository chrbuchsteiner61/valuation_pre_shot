import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/constants.dart';
import 'package:valuation_pre_shot/l10n.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/numerical_formatter.dart';

class SingleValuation extends StatelessWidget {
  final int strokeNumber;
  final TextEditingController aController;
  final bool visibleElement;

  const SingleValuation({
    super.key,
    required this.strokeNumber,
    required this.aController,
    required this.visibleElement,
  });

  SizedBox get aSpaceSmall => const SizedBox(width: 4);
  SizedBox get aSpaceMiddle => const SizedBox(width: 12);

  String convertStrokeNumberToTee(int strokeNumber) {
    int strokeOnATee = strokeNumber % numberOfStrokesPerTee;
    if (strokeOnATee == 0) {
      strokeOnATee = 10;
    }
    return strokeOnATee.toString();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Visibility(
      visible: visibleElement,
      child: Center(
        child: Container(
          width: 150,
          height: 40,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: <Widget>[
                aSpaceSmall,
                StyledText(
                  aText: localizations.translate('aStroke'),
                  aWidth: 60,
                  aAlignment: TextAlign.left,
                ),
                StyledText(
                  aText: convertStrokeNumberToTee(strokeNumber),
                  aWidth: 28,
                  aAlignment: TextAlign.right,
                ),
                aSpaceMiddle,
                SizedBox(
                  width: 38,
                  child: TextField(
                    controller: aController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(12, 2, 8, 3),
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
