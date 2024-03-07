import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/pdf_stroke_page.dart';
import 'package:valuation_pre_shot/main.dart';

var logger = Logger();

class SaveYourRound extends StatelessWidget {
//  final ATable aTable;
  final dynamic aFunction;
  final dynamic aControllerFunction;

  const SaveYourRound({
    super.key,
    //   required this.aTable,
    required this.aFunction,
    required this.aControllerFunction,
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

    int currentTee = 0;

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
            currentTee = context.read<TeeProvider>().aTee;

            String aRoutine = aFunction();

            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => PdfStrokePage(
                        allStrokes: aControllerFunction(),
                        aRoutineElement: aRoutine,
                      )),
            ); // generate a pdf
          },
          tooltip: 'close a round and generate a pdf',
          child: Icon(Icons.save, color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
