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
  final dynamic aFunction;

  final int previousTee;
  int newTee = 0;

  InDecreaseButton(
      {super.key,
      required this.aDirection,
      required this.aTable,
      required this.previousTee,
      required this.aFunction});

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

            context.read<ChangeStrokeValuationOfATee>().changeStrokesOfATee();

            // get a row with tee from widget
            // for Test
            logger.d(previousTee);
            logger.d(newTee);
            ARow outOfStrokesOfTee = ARow(10, ' ');
            logger
                .d('Inhalt des TextController Array ${aFunction().toString()}');

            outOfStrokesOfTee.valueRow = aFunction();
            outOfStrokesOfTee.numberOfRow = previousTee;

            // update runs, change name of parameter testRow
            aTable.updateValuesOfARow(outOfStrokesOfTee);
            // testing
            logger.d(aTable.values.toString());
            //put a row from table to new tee
            // put the row in widget
            outOfStrokesOfTee.getStrokesFromTable(aTable, newTee);
            logger.d(outOfStrokesOfTee.valueRow.toString());
          }),
    );
  }
}
