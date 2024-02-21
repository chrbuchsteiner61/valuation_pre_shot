import 'package:flutter/material.dart';

import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/pdf_stroke_page.dart';

class SaveYourRound extends StatelessWidget {
  final List<List<String>> aTable;
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
    // logger.d(aTable.toString());
    return Row(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: 30,
        ),
        Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: saveRoundText,
        ),
        Container(
          color: Colors.white,
          width: 30,
        ),
        FloatingActionButton(
          onPressed: () async {
            String aRoutine = aFunction();
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => PdfStrokePage(
                        strokeTable: aTable,
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
