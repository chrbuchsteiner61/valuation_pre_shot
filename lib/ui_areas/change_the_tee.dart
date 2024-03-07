import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuation_pre_shot/ui_elements/colored_container.dart';
import 'package:valuation_pre_shot/ui_elements/in_decrease_button.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';

import '../main.dart';

class ChangeTheTee extends StatelessWidget {
  final dynamic aFunction;
  const ChangeTheTee({super.key, required this.aFunction});

  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      aWidget: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: StyledText(
            aText: 'Bahn ',
            aWidth: 110,
            aLignment: 'left',
          ),
        ),
        Row(
          children: <Widget>[
            InDecreaseButton(
                aDirection: 'back',
                //aTable: aTable,
                previousTee: context.watch<TeeProvider>().aTee,
                aFunction: aFunction),
            StyledText(
              aText: '${context.watch<TeeProvider>().aTee}',
              key: const Key('counterState'),
              aWidth: 36,
              aLignment: 'center',
            ),
            InDecreaseButton(
              aDirection: 'forward',
              previousTee: context.watch<TeeProvider>().aTee,
              aFunction: aFunction,
            ),
          ],
        ),
      ]),
    );
  }
}
