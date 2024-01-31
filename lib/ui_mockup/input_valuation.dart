import 'package:flutter/cupertino.dart';
import 'package:valuation_pre_shot/ui_mockup/single_valuation.dart';

class InputValuation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SingleValuation(teeNumber: 1),
          SingleValuation(teeNumber: 2),
          SingleValuation(teeNumber: 3),
          SingleValuation(teeNumber: 4),
          SingleValuation(teeNumber: 5),
          SingleValuation(teeNumber: 6),
          SingleValuation(teeNumber: 7),
          SingleValuation(teeNumber: 8),
          SingleValuation(teeNumber: 9),
          SingleValuation(teeNumber: 10),
        ],
      ),
    );
  }
}
