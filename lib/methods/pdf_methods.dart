import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

Future<Uint8List> generatePdf(
    PdfPageFormat format,
    String routineElement,
    String aSubHeader,
    String rountineText,
    String formattedDate,
    List<List<String>> strokeTable) async {
  // Text styles
  //var font = await rootBundle.load("assets/fonts/NotoSans-Medium.ttf");
  final ttf = await fontFromAssetBundle('assets/fonts/NotoSans-Medium.ttf');
  //var ttf = pw.Font.ttf(font);
  pw.TextStyle headerStyle = pw.TextStyle(fontSize: 16, font: ttf);
  pw.TextStyle cellStyle = pw.TextStyle(fontSize: 14, font: ttf);

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
              child: pw.Text(rountineText + routineElement, style: headerStyle),
            ),
            pw.SizedBox(height: 40),
            pw.TableHelper.fromTextArray(
              data: strokeTable,
              cellAlignment: pw.Alignment.topRight,
              cellStyle: cellStyle,
              headerStyle: headerStyle,
            ),
          ],
        );
      },
    ),
  );
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

  return strokeTable;
}
