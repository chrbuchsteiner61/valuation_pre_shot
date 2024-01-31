import 'package:flutter/material.dart';

import 'package:valuation_pre_shot/input_your_routine_element.dart';
import 'package:valuation_pre_shot/change_the_tee.dart';
import 'package:valuation_pre_shot/input_valuation.dart';
import 'package:valuation_pre_shot/save_your_round.dart';

class UiDemo extends StatelessWidget {
  const UiDemo({super.key});

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
