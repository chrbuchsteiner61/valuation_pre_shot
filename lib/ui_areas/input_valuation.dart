import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuation_pre_shot/ui_areas/single_valuation.dart';

class InputValuation extends StatelessWidget {
  const InputValuation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SingleValuation(strokeNumber: 1),
          SingleValuation(strokeNumber: 2),
          SingleValuation(strokeNumber: 3),
          SingleValuation(strokeNumber: 4),
          SingleValuation(strokeNumber: 5),
          SingleValuation(strokeNumber: 6),
          SingleValuation(strokeNumber: 7),
          SingleValuation(strokeNumber: 8),
          SingleValuation(strokeNumber: 9),
          SingleValuation(strokeNumber: 10),
        ],
      ),
    );
  }
}

