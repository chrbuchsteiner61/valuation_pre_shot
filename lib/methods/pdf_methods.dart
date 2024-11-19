import 'dart:typed_data';
//import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:logger/logger.dart';
import 'package:valuation_pre_shot/constants.dart';

var logger = Logger();

Future<Uint8List> generatePdf(
  PdfPageFormat format,
  String routineElement,
  String aSubHeader,
  String rountineText,
  String formattedDate,
  String aTitle,
  String aTableHeader,
  List<String> allStrokes,
) async {
  List<List<String>> strokeTable = createStrokeTable(allStrokes, numberOfTees,
      numberOfStrokesPerTee, initialValue, aTableHeader);
  // Text styles
  final ttf = await fontFromAssetBundle('assets/fonts/NotoSans-Medium.ttf');
  pw.TextStyle headerStyle = pw.TextStyle(fontSize: 16, font: ttf);
  pw.TextStyle cellStyle = pw.TextStyle(fontSize: 14, font: ttf);

  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Column(
          children: [
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(aSubHeader + formattedDate, style: headerStyle),
            ),
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(rountineText + routineElement, style: headerStyle),
            ),
            pw.SizedBox(height: 40),
            pw.TableHelper.fromTextArray(
              data: strokeTable,
              cellAlignment: pw.Alignment.topRight,
              cellStyle: cellStyle,
              headerStyle: headerStyle,
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey200,
              ),
              cellHeight: 30,
              border: pw.TableBorder.all(
                color: PdfColors.black,
                width: 1.0,
              ),
            ),
          ],
        );
      },
    ),
  );
 
  logger.d('generatePdf called');
  return pdf.save();
}

List<List<String>> createStrokeTable(List<String> allStrokes, int numberOfTees,
    int numberOfStrokesPerTee, String initialValue, String aTableHeader) {
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

  logger.d('createStrokeTable called');

  return strokeTable;
}
