import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:valuation_pre_shot/main.dart';

var logger = Logger();

class PdfStrokePage extends StatelessWidget {
  final String title = 'Post Shot Routine: Bewertung';

  //final dynamic aFunction;
  final ATable strokeTable;
  final String aRoutineElement;

  const PdfStrokePage(
      {super.key, required this.strokeTable, required this.aRoutineElement});

  @override
  Widget build(BuildContext context) {
    logger.d(strokeTable.values.toString());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(strokeTable, aRoutineElement),
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
  }

  Future<Uint8List> _generatePdf(
      ATable aStrokeTable, String routineElement) async {
    // text formats
    pw.TextStyle formatH2 = const pw.TextStyle(
      fontSize: 16,
    );
    pw.TextStyle formatP = const pw.TextStyle(
      fontSize: 14,
    );

    final DateFormat formatter = DateFormat('d.MM.yyyy');
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
                  data: aStrokeTable.values,
                  cellAlignment: pw.Alignment.topRight,
                  cellStyle: formatP,
                ),
              ],
              //crossAxisAlignment: pw.CrossAxisAlignment.start,
            );
          }),
    );
    return pdf.save();
  }
}