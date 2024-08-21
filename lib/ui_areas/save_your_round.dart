import 'package:flutter/material.dart';

import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/pdf_stroke_page.dart';

class SaveYourRound extends StatelessWidget {
  final dynamic aFunction;
  final dynamic aControllerFunction;
  final String closeRoundText;
  final String aPdfTitle;
  final String aPdfTableHeader;
  final String aPdfSubHeader;
  final String aPdfRoutineText;

  const SaveYourRound({
    super.key,
    required this.aFunction,
    required this.aControllerFunction,
    required this.closeRoundText,
    required this.aPdfTitle,
    required this.aPdfTableHeader,
    required this.aPdfSubHeader,
    required this.aPdfRoutineText,
  });

  @override
  Widget build(BuildContext context) {
    //final localizations = AppLocalizations.of(context);
    StyledText saveRoundText = StyledText(
      // aText: localizations!.closeTheRound,
      aText: closeRoundText,
      aWidth: 190,
      aAlignment: TextAlign.left,
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
                            routineElement: aRoutine,
                            aTitle: aPdfTitle,
                            aTableHeader: aPdfTableHeader,
                            aSubHeader: aPdfSubHeader,
                            aRoutineText: aPdfRoutineText,
                            //strokeTable: strokeTable,
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
