import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'dart:typed_data';
// import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

var logger = Logger();

class PdfStrokePage extends StatelessWidget {
  final String title = 'Stroke valuation';

  const PdfStrokePage({super.key});

  @override
  Widget build(BuildContext context) {
    // for test reasons

    String routineElement = 'ein Teil der Routine';
    List<int> strokeRow = [];
    List<List<int>> testStrokeTable = [];

    int tees = 18;
    int strokes = 10;
    for (int i = 0; i < tees; i++) {
      for (int j = 0; j < strokes; j++) {
        strokeRow.add(2);
      }
      testStrokeTable.add(strokeRow);
      strokeRow = [];
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(testStrokeTable, routineElement),
        ),
      ),
    );
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = '${output.path}/$fileName';
    logger.d(filePath);
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    //await OpenDocument.openDocument(filePath: filePath);
  }

  Future<Uint8List> _generatePdf(
      List<List<int>> strokeTable, String routineElement) async {
    // text formats
    TextStyle formatH2 = TextStyle(
      fontSize: 16,
    );
    TextStyle formatP = TextStyle(
      fontSize: 14,
    );

    List<String> headRow = [];
    headRow.add('Bahn / Schlag');
    for (int i = 0; i < 10; i++) {
      headRow.add((i + 1).toString());
    }
    List<String> leftColumn = [];
    for (int i = 0; i < 18; i++) {
      leftColumn.add((i + 1).toString());
    }

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Runde von heute',
                    ),
                    pw.Text(
                        'Beurteilter Teil der Pre shot-Routine: $routineElement'),
                  ],
                ),
                pw.TableHelper.fromTextArray(
                  data: strokeTable,
                  cellAlignment: pw.Alignment.topRight,
                ),
              ],
              //crossAxisAlignment: pw.CrossAxisAlignment.start,
            );
          }),
    );
    return pdf.save();
  }
}
