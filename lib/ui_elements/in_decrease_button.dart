import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../main.dart';

var logger = Logger();

class InDecreaseButton extends StatelessWidget {
  String aDirection;
  final int lowestTee = 1;
  final int highestTee = 18;
  final ATable aTable;

  final int previousTee;
  int newTee = 0;

  InDecreaseButton(
      {super.key,
      required this.aDirection,
      required this.aTable,
      required this.previousTee});

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
            context
                .read<ChangeTheTeeProvider>()
                .inDecreaseANumber(addValue, lowestTee, highestTee);

            // get a row with tee
            // for Test
            logger.d(previousTee);
            logger.d(newTee);
            ARow testRow = ARow(10, 'Test');
            testRow.numberOfRow = previousTee;
            aTable.updateValuesOfARow(testRow);
            //put a row from table to new tee
            testRow.getStrokesFromTable(aTable, newTee);
            // testing
            logger.d(aTable.values.toString());
            logger.d(testRow.valueRow);
            logger.d(testRow.numberOfRow);
          }),
    );
  }
}
