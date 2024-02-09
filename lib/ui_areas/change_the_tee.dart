import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valuation_pre_shot/ui_elements/colored_container.dart';
import 'package:valuation_pre_shot/ui_elements/in_decrease_button.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';

import '../main.dart';

class ChangeTheTee extends StatelessWidget {
  const ChangeTheTee({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //color: Colors.green,
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
            InDecreaseButton(aDirection: 'back'),
            StyledText(
              aText: '${context.watch<ChangeNumber>().aTee}',
              key: const Key('counterState'),
              aWidth: 36,
              aLignment: 'center',
            ),
            InDecreaseButton(aDirection: 'forward'),
          ],
        ),
      ]),
    );
  }
}
