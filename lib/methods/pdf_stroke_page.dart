import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:printing/printing.dart';
import 'package:valuation_pre_shot/constants.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final logger = Logger();

class PdfStrokePage extends StatelessWidget {
  final List<String> allStrokes;
  final String routineElement;
  final String aTitle;
  final String aTableHeader;
  final String aSubHeader;
  final String aRoutineText;

  const PdfStrokePage({
    super.key,
    required this.allStrokes,
    required this.routineElement,
    required this.aTitle, 
    required this.aTableHeader,
    required this.aSubHeader,
    required this.aRoutineText,
    
  });

  @override
  Widget build(BuildContext context) {
    //final localizations = AppLocalizations.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(aTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.home_rounded,
                  color: Colors.blue, size: 30.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: PdfPreview(
          build: (format) => _generatePdf(allStrokes, routineElement, context),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      List<String> allStrokes, String routineElement, context) async {
    //final localizations = AppLocalizations.of(context);

    int teeIndex = 0;
    int strokeIndex = 0;

    List<List<String>> strokeTable = List.generate(
      numberOfTees + 1,
      (index) => List.generate(
          numberOfStrokesPerTee + 1, (int index) => initialValue,
          growable: false),
      growable: false,
    );

    strokeTable[0][0] = aTableHeader;

    for (int i = 1; i <= numberOfStrokesPerTee; i++) {
      strokeTable[0][i] = i.toString();
    }

    for (int j = 1; j <= numberOfTees; j++) {
      strokeTable[j][0] = j.toString();
    }

    for (int i = 0; i < allStrokes.length; i++) {
      teeIndex = i ~/ numberOfStrokesPerTee;
      strokeIndex = i % numberOfStrokesPerTee;
      strokeTable[teeIndex + 1][strokeIndex + 1] = allStrokes[i];
    }

    // Text styles
    const pw.TextStyle headerStyle = pw.TextStyle(fontSize: 16);
    const pw.TextStyle cellStyle = pw.TextStyle(fontSize: 14);

    final String formattedDate = DateFormat('d.MM.yyyy').format(DateTime.now());

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(aSubHeader + formattedDate,
                    style: headerStyle),
              ),
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(aRoutineText + routineElement,
                    style: headerStyle),
              ),
              pw.SizedBox(height: 40),
              pw.TableHelper.fromTextArray(
                data: strokeTable,
                cellAlignment: pw.Alignment.topRight,
                cellStyle: cellStyle,
              ),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}
