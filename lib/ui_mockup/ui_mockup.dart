import 'package:flutter/material.dart';

import 'package:valuation_pre_shot/ui_mockup/input_your_routine_element.dart';
import 'package:valuation_pre_shot/ui_mockup/change_the_tee.dart';
import 'package:valuation_pre_shot/ui_mockup/input_valuation.dart';
import 'package:valuation_pre_shot/ui_mockup/save_your_round.dart';

class UiMockup extends StatelessWidget {
  const UiMockup({super.key});

  // UiDemo();

  @override
  Widget build(BuildContext context) {
    return
        //Text('Golf Post Shot App');
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const InputYourRoutineElement(),
        const ChangeTheTee(),
        Center(
          child: InputValuation(),
        ),
        const SaveYourRound()
      ],
    );
  }
}
