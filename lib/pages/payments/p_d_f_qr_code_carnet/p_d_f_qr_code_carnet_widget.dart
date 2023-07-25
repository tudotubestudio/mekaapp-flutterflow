import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_qr_code_carnet_model.dart';
export 'p_d_f_qr_code_carnet_model.dart';

class PDFQrCodeCarnetWidget extends StatefulWidget {
  const PDFQrCodeCarnetWidget({
    Key? key,
    this.carnet,
  }) : super(key: key);

  final dynamic carnet;

  @override
  _PDFQrCodeCarnetWidgetState createState() => _PDFQrCodeCarnetWidgetState();
}

class _PDFQrCodeCarnetWidgetState extends State<PDFQrCodeCarnetWidget> {
  late PDFQrCodeCarnetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFQrCodeCarnetModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PDFQrCodeCarnet'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BarcodeWidget(
                      data: getJsonField(
                        widget.carnet,
                        r'''$.xx_paymentbook_id''',
                      ).toString(),
                      barcode: Barcode.qrCode(),
                      width: 200.0,
                      height: 200.0,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                      errorBuilder: (_context, _error) => SizedBox(
                        width: 200.0,
                        height: 200.0,
                      ),
                      drawText: false,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Text(
                        FFAppState().NameCompany,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Text(
                      getJsonField(
                        widget.carnet,
                        r'''$.name''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      '${getJsonField(
                        widget.carnet,
                        r'''$.sernofrom''',
                      ).toString()}-${getJsonField(
                        widget.carnet,
                        r'''$.sernoto''',
                      ).toString()}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
