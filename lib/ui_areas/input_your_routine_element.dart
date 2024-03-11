import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/ui_elements/colored_container.dart';

class InputYourRoutineElement extends StatelessWidget {
  final TextEditingController aController;

  const InputYourRoutineElement({super.key, required this.aController});

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: TextField(
                controller: aController,
                decoration: InputDecoration(
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
                  hintText: 'Element der Pre-Shot-Routine',
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
