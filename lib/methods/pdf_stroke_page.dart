import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:valuation_pre_shot/methods/pdf_methods.dart';

// import '../ui_elements/the_info_drawer.dart';

class PdfStrokePage extends StatelessWidget {
  final List<String> allStrokes;
  // final List<List<String>> strokeTable;
  final String routineElement;
  final String aTitle;
  final String aTableHeader;
  final String aSubHeader;
  final String aRoutineText;
  final String formattedDate;

  const PdfStrokePage(
      {super.key,
      required this.allStrokes,
      // required this.strokeTable,
      required this.routineElement,
      required this.aTitle,
      required this.aTableHeader,
      required this.aSubHeader,
      required this.aRoutineText,
      required this.formattedDate});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(aTitle),
          backgroundColor: Colors.green[300],
        ),
        body: PdfPreview(
          build: (format) => generatePdf(
              PdfPageFormat.a4,
              routineElement,
              aSubHeader,
              aRoutineText,
              formattedDate,
              aTitle,
              aTableHeader,
              allStrokes),
        ),
      ),
    );
  }
}
