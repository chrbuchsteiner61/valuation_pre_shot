import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:printing/printing.dart';

import 'package:valuation_pre_shot/constants.dart';
import 'package:valuation_pre_shot/styles/theme_data.dart';

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

  List<List<String>> createStrokeTable(
      List<String> allStrokes,
      int numberOfTees,
      int numberOfStrokesPerTee,
      String initialValue,
      String aTableHeader) {
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

    return strokeTable;
  }

  @override
  Widget build(BuildContext context) {
    final strokeTable = createStrokeTable(allStrokes, numberOfTees,
        numberOfStrokesPerTee, initialValue, aTableHeader);
    final String formattedDate = DateFormat('d.MM.yyyy').format(DateTime.now());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: Scaffold(
        appBar: AppBar(
          title: Text(aTitle),
        ),
        body: PdfPreview(
          build: (format) => _generatePdf(format, routineElement, aSubHeader,
              aRoutineText, formattedDate, strokeTable),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format,
      String routineElement,
      String aSubHeader,
      String aRountineText,
      String formattedDate,
      List<List<String>> strokeTable) async {
    // Text styles
    const pw.TextStyle headerStyle = pw.TextStyle(fontSize: 16);
    const pw.TextStyle cellStyle = pw.TextStyle(fontSize: 14);

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(aSubHeader + formattedDate, style: headerStyle),
              ),
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child:
                    pw.Text(aRoutineText + routineElement, style: headerStyle),
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
