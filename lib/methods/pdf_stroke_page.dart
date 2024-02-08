import 'package:logger/logger.dart';

import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:typed_data';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';

var logger = Logger();

class PdfStrokePage {
  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = '${output.path}/$fileName';
    logger.d(filePath);
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenDocument.openDocument(filePath: filePath);
  }

  Future<Uint8List> generatePdf() async {
    String preShotElement = 'something';
    // Datum
    //

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Align(
            child: pw.Text('Beurteiltes Element der Pre-Shot-Routine: $preShotElement'),
          );
        },
      ),
    );

    logger.d(pdf);
    return pdf.save();
  }
}
