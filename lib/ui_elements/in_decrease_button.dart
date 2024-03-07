import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../main.dart';

var logger = Logger();

class InDecreaseButton extends StatelessWidget {
  final String aDirection;
  final int lowestTee = 1;
  final int highestTee = 18;
  final dynamic aFunction;
  final int previousTee;

  InDecreaseButton(
      {super.key,
      required this.aDirection,
      required this.previousTee,
      required this.aFunction});

  int newTee = 0;
  Icon anIcon = const Icon(Icons.arrow_forward);
  int addValue = 0;

  @override
  Widget build(BuildContext context) {
    switch (aDirection) {
      case 'back':
        anIcon = const Icon(Icons.arrow_back);
        addValue = -1;

      case 'forward':
        anIcon = const Icon(Icons.arrow_forward);
        addValue = 1;

      default:
        'no action';
        addValue = 0;
    }

    newTee = previousTee + addValue;

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
          tooltip: 'back or forward',
          onPressed: () {
            Provider.of<TeeProvider>(context, listen: false)
                .inDecreaseANumber(addValue, lowestTee, highestTee);
          }),
    );
  }
}
