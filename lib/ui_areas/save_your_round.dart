import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/pdf_stroke_page.dart';
import 'package:valuation_pre_shot/main.dart';

var logger = Logger();

class SaveYourRound extends StatelessWidget {
  final ATable aTable;
  final dynamic aFunction;

  const SaveYourRound({
    super.key,
    required this.aTable,
    required this.aFunction,
  });

  @override
  Widget build(BuildContext context) {

    StyledText saveRoundText = StyledText(
      aText: 'Runde abschliessen ',
      aWidth: 200,
      aLignment: 'left',
    );

    Container aSpaceBetween = Container(
      color: Colors.white,
      width: 30,
    );

    aTable.values[5][5] = '55';
    logger.d(aTable.values.toString());
    return Row(
      children: <Widget>[
        aSpaceBetween,
        Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: saveRoundText,
        ),
        aSpaceBetween,
        FloatingActionButton(
          onPressed: () async {
            String aRoutine = aFunction();
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => PdfStrokePage(
                        strokeTable: aTable,
                        aRoutineElement: aRoutine,
                      )
              ),
            ); // generate a pdf
          },
          tooltip: 'close a round and generate a pdf',
          child: Icon(Icons.save, color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
