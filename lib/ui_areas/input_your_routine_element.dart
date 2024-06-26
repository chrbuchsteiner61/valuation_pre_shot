import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/ui_elements/colored_container.dart';
import 'package:valuation_pre_shot/l10n.dart';

class InputYourRoutineElement extends StatelessWidget {
  final TextEditingController aController;

  const InputYourRoutineElement({super.key, required this.aController});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return ColoredContainer(
      aWidget: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: StyledText(
              aText: localizations.translate('chooseYourRoutine'),
              aWidth: 150,
              aAlignment: TextAlign.left,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: TextField(
                controller: aController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(12, 2, 8, 3),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: localizations.translate('hintTextRoutine'),
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
