import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:intl/date_symbol_data_local.dart';

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
  List<List<String>> strokeTable = [
    ['empty'],
    ['empty, too']
  ];

  PdfStrokePage({super.key, required this.strokeTable});

  @override
  Widget build(BuildContext context) {
    // for test reasons

    String routineElement = 'Ausrichtung';
    logger.d('pdf_stroke..: $strokeTable.toString()');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(strokeTable, routineElement),
        ),
      ),
    );
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = '${output.path}/$fileName';
    // logger.d(filePath);
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    //await OpenDocument.openDocument(filePath: filePath);
  }

  Future<Uint8List> _generatePdf(
      List<List<String>> aStrokeTable, String routineElement) async {
    // text formats
    pw.TextStyle formatH2 = const pw.TextStyle(
      fontSize: 16,
    );
    pw.TextStyle formatP = const pw.TextStyle(
      fontSize: 14,
    );

    logger.d(aStrokeTable.toString());

    final DateFormat formatter = DateFormat('dd.mm.yyyy');
    final String toDay = formatter.format(DateTime.now());

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Column(
              children: [
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    'Runde vom $toDay',
                    style: formatH2,
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    'Beurteilter Teil der Pre shot-Routine: $routineElement',
                    style: formatH2,
                  ),
                ),
                pw.SizedBox(width: 200, height: 40),
                pw.TableHelper.fromTextArray(
                  data: aStrokeTable,
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
