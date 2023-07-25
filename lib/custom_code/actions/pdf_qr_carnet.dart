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

Future pdfQrCarnet(
  BuildContext context,
  String campany,
  String name,
  String barecode,
  String from,
  String to,
) async {
  // Add your function code here!

  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat(275, 170),
      //orientation: pw.PageOrientation.landscape,
      margin: pw.EdgeInsets.all(10),
      build: (pw.Context context) {
        return pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Align(
              //alignment: pw.AlignmentDirectional(0, 0),
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.max,
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.BarcodeWidget(
                    data: barecode,
                    barcode: pw.Barcode.qrCode(),
                    width: 60,
                    height: 60,
                    color: PdfColors.black,
                    drawText: false,
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(8),
                    child: pw.Text(
                      campany,
                      //style: pw.Theme.of(context).bodyMedium,
                    ),
                  ),
                  pw.Text(
                    name,
                    // style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.normal,
                    //     ),
                  ),
                  pw.Text(
                    from + '-' + to,
                    // style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //       fontFamily: 'Poppins',
                    //       fontWeight: FontWeight.normal,
                    //     ),
                  ),
                ],
              ),
            ),
          ],
        );
      })); // Page

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
