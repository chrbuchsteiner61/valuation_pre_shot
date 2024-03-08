import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/pdf_stroke_page.dart';

var logger = Logger();

class SaveYourRound extends StatelessWidget {
  final dynamic aFunction;
  final dynamic aControllerFunction;

  const SaveYourRound({
    super.key,
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
      width: 10,
    );

    return Row(children: <Widget>[
      aSpaceBetween,
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: <Widget>[
            saveRoundText,
            aSpaceBetween,
            FloatingActionButton(
              onPressed: () async {
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
              child: Icon(Icons.save,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      )
    ]);
  }
}
