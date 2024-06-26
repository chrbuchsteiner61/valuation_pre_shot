import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuation_pre_shot/l10n.dart';
import 'package:valuation_pre_shot/ui_elements/colored_container.dart';
import 'package:valuation_pre_shot/ui_elements/in_decrease_button.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';

import '../main.dart';

enum TheDirection { back, forward }

class ChangeTheTee extends StatelessWidget {
  final dynamic aFunction;
  const ChangeTheTee({super.key, required this.aFunction});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return ColoredContainer(
      aWidget: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: StyledText(
            aText: localizations.translate('theTee'),
            aWidth: 110,
            aAlignment: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[
            InDecreaseButton(
                aDirection: TheDirection.back,
                previousTee: context.watch<TeeProvider>().aTee,
                aFunction: aFunction),
            StyledText(
              aText: '${context.watch<TeeProvider>().aTee}',
              key: const Key('counterState'),
              aWidth: 36,
              aAlignment: TextAlign.center,
            ),
            InDecreaseButton(
              aDirection: TheDirection.forward,
              previousTee: context.watch<TeeProvider>().aTee,
              aFunction: aFunction,
            ),
          ],
        ),
      ]),
    );
  }
}
