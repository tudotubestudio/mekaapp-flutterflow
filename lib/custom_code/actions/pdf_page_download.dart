// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future pdfPageDownload(
  String title,
  String body,
  String bareCode,
) async {
  // Add your function code here!

  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Text(title,
              style: const pw.TextStyle(
                // color: PdfColors.cyan
                fontSize: 40,
              )),
          pw.Divider(thickness: 4),
          pw.Text("Hello World"),
          pw.SizedBox(height: 10),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [pw.SizedBox(width: 10), pw.Text(body)],
          )
        ]);
      })); // Page

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
