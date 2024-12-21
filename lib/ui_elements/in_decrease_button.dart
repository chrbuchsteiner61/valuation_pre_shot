import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:valuation_pre_shot/ui_areas/change_the_tee.dart';
import '../main.dart';

var logger = Logger();

class InDecreaseButton extends StatelessWidget {
  final TheDirection aDirection;
  final int lowestTee = 1;
  final int highestTee = 18;
  final dynamic aFunction;
  final int previousTee;

  const InDecreaseButton(
      {super.key,
      required this.aDirection,
      required this.previousTee,
      required this.aFunction});

  @override
  Widget build(BuildContext context) {
    Icon anIcon = const Icon(Icons.arrow_forward);
    int addValue = 0;

    switch (aDirection) {
      case TheDirection.back:
        anIcon = const Icon(Icons.arrow_back);
        addValue = -1;

      case TheDirection.forward:
        anIcon = const Icon(Icons.arrow_forward);
        addValue = 1;

      default:
        'no action';
        addValue = 0;
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.all(4),
      child: IconButton(
          icon: anIcon,
          color: Colors.black,
          tooltip: '-1 or +1',
          onPressed: () {
            Provider.of<TeeProvider>(context, listen: false)
                .inDecreaseANumber(addValue, lowestTee, highestTee);
          }),
    );
  }
}
