import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:pdf/widgets.dart' as pw;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(),
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

  Future<Uint8List> _generatePdf() async {
    String preShotElement = 'something';
    // Datum
    //

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Align(
            child: pw.Text(
                'Beurteiltes Element der Pre-Shot-Routine: $preShotElement'),
          );
        },
      ),
    );

    logger.d(pdf);
    return pdf.save();
  }
}
