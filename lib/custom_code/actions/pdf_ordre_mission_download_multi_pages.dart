// Automatic FlutterFlow imports
import '/backend/backend.dart';
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

Future pdfOrdreMissionDownloadMultiPages(
    BuildContext context,
    String nOrdre,
    String name,
    String destination,
    String truck,
    String dateStart,
    String dateEnd,
    String? accompacnateur,
    String dateCreated,
    String createdBy,
    String bareCode,
    List<dynamic> dataClients) async {
  // Add your function code here!

  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (context) => [
        //One page
        pw.Container(
          width: 554,
          height: 801,
          child: pw.Padding(
            padding: pw.EdgeInsets.all(20),
            child: pw.Column(
              mainAxisSize: pw.MainAxisSize.max,
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Text(
                    'SARL CHARK PHARM',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Text(
                    'Vente en gros de Produits Pharmaceutiques',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(2),
                  child: pw.Text(
                    'Adresse: Zone Industrielle - BATNA',
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(2),
                  child: pw.Text(
                    'Tel: 033.18.33.97 / 033.18.33.98',
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(2),
                  child: pw.Text(
                    '0560.999.444 - 0560.900.255',
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Text(
                    'Ordre de Mission',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Text(
                    'N°: ' + nOrdre,
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.fromLTRB(4, 10, 4, 4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Nom et Prénom: ' + name,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Destination: ' + destination,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Moyen de locomotion: ' + truck,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Date de départ: ' + dateStart,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.fromLTRB(100, 0, 0, 0),
                        child: pw.Text(
                          'Date de retour: ' + dateEnd,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Accompagnateur: ' + accompacnateur!,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Kilométrage au compteur: ',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Départ: ...............',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.fromLTRB(100, 0, 0, 0),
                        child: pw.Text(
                          'Arrivée: ...............',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Carburant: ',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'N° de bons: ...............',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Autres dépenses: ...............',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.fromLTRB(4, 4, 4, 50),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Fait à Batna le: ' + dateCreated,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: pw.Text(
                          'Cachet et signature: ',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text(
                        'Etablie par: ' + createdBy,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Padding(
                    padding: pw.EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.max,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.BarcodeWidget(
                          data: bareCode,
                          barcode: pw.Barcode.qrCode(),
                          width: 80,
                          height: 80,
                          // color: new Colors.black,
                          // errorBuilder: (_context, _error) => pw.SizedBox(
                          //   width: 150,
                          //   height: 150,
                          // ),
                          drawText: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //pw.Container(width: 200, height: 600),
        //pw.Container(width: 200, height: 600),

        //two page
        pw.Container(
          width: 554,
          height: 801,
          child: pw.Column(
            mainAxisSize: pw.MainAxisSize.max,
            children: [
              pw.Row(
                mainAxisSize: pw.MainAxisSize.max,
                children: [],
              ),
              pw.Container(
                width: 554,
                height: 60,
                decoration: pw.BoxDecoration(
                  //color: FlutterFlowTheme.of(context).lineColor,
                  border: pw.Border.all(
                    width: 1,
                  ),
                ),
                child: pw.Row(
                  mainAxisSize: pw.MainAxisSize.max,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Text(
                      'Client',
                      // style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    pw.Text(
                      'H.E',
                      // style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    pw.Text(
                      'BareCode',
                      // style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    pw.Text(
                      'Accusé client',
                      // style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              pw.Expanded(
                child: pw.Padding(
                  padding: pw.EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: pw.Builder(
                    builder: (context) {
                      final client = dataClients ?? [];
                      return pw.ListView.builder(
                        padding: pw.EdgeInsets.zero,
                        // shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        itemCount: client.length,
                        itemBuilder: (context, clientIndex) {
                          final clientItem = client[clientIndex];
                          return pw.Container(
                            width: 554,
                            height: 110,
                            decoration: pw.BoxDecoration(),
                            child: pw.Column(
                              mainAxisSize: pw.MainAxisSize.max,
                              children: [
                                pw.Row(
                                  mainAxisSize: pw.MainAxisSize.max,
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceEvenly,
                                  children: [
                                    pw.Text(
                                      clientItem['name'],
                                      // style:
                                      //     FlutterFlowTheme.of(context)
                                      //         .bodyMedium,
                                    ),
                                    pw.SizedBox(
                                      height: 30,
                                      child: pw.VerticalDivider(
                                        thickness: 1,
                                        // color:
                                        //     FlutterFlowTheme.of(context)
                                        //         .accent4,
                                      ),
                                    ),
                                    pw.Text(
                                      clientItem['tot_echue_non_couvert'],
                                      // style: FlutterFlowTheme.of(context)tot_echue_non_couvert
                                      //     .bodyMedium,
                                    ),
                                    pw.SizedBox(
                                      height: 30,
                                      child: pw.VerticalDivider(
                                        thickness: 1,
                                        // color: FlutterFlowTheme.of(context)
                                        //     .accent4,
                                      ),
                                    ),
                                    pw.BarcodeWidget(
                                      data: clientItem['c_bpartner_id'],
                                      barcode: pw.Barcode.code128(),
                                      width: 80,
                                      height: 50,
                                      //color: Colors.black,
                                      //backgroundColor: Colors.transparent,
                                      drawText: true,
                                    ),
                                    pw.Container(
                                      width: 100,
                                      height: 100,
                                      decoration: pw.BoxDecoration(
                                        // color: FlutterFlowTheme.of(context)
                                        //     .secondaryBackground,
                                        borderRadius:
                                            pw.BorderRadius.circular(2),
                                        border: pw.Border.all(
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                pw.Divider(
                                  thickness: 1,
                                  // color: FlutterFlowTheme.of(context).accent4,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ], //here goes the widgets list
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
