import 'package:flutter/material.dart';

import 'package:valuation_pre_shot/ui_elements/styled_text.dart';
import 'package:valuation_pre_shot/methods/pdf_stroke_page.dart';

class SaveYourRound extends StatelessWidget {
  List<List<String>> aTable = [];
  SaveYourRound({super.key, required List<List<String>> this.aTable});

  final String aFileName = 'golf_stroke_valuation.pdf';
 // PdfStrokePage aStrokePage = PdfStrokePage();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: 30,
        ),
        Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: StyledText(
            aText: 'Runde abschliessen ',
            aWidth: 200,
            aLignment: 'left',
          ),
        ),
        Container(
          color: Colors.white,
          width: 30,
        ),
        FloatingActionButton(
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PdfStrokePage(strokeTable: aTable)),
            ); // generate a pdf

            //final strokePDF = await aStrokePage._generatePdf();
            //aStrokePage.savePdfFile(aFileName, strokePDF);
            logger.d(aTable);
          },
          tooltip: 'close a round and generate a pdf',
          child: Icon(Icons.save, color: Theme.of(context).colorScheme.primary),
        ),
        //PdfPreview(
        //  build: (format) => generatePdf(format),
        // ),
      ],
    );
  }
}

//int _counter = 0;

//void _incrementCounter() {
//setState(() {
// This call to setState tells the Flutter framework that something has
// changed in this State, which causes it to rerun the build method below
// so that the display can reflect the updated values. If we changed
// _counter without calling setState(), then the build method would not be
// called again, and so nothing would appear to happen.
//_counter++;
//});}
