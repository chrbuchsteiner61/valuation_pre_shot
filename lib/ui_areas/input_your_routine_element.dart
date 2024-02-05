import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/ui_elements/colored_container.dart';

class InputYourRoutineElement extends StatelessWidget {
  const InputYourRoutineElement({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      aWidget: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: StyledText(
              aText: 'Ich bewerte mein/e ',
              aWidth: 150,
              aLignment: 'left',
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Element der Pre-Shot-Routine',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
