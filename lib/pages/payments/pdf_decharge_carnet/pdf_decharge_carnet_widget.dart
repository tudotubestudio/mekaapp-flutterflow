import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdf_decharge_carnet_model.dart';
export 'pdf_decharge_carnet_model.dart';

class PdfDechargeCarnetWidget extends StatefulWidget {
  const PdfDechargeCarnetWidget({Key? key}) : super(key: key);

  @override
  _PdfDechargeCarnetWidgetState createState() =>
      _PdfDechargeCarnetWidgetState();
}

class _PdfDechargeCarnetWidgetState extends State<PdfDechargeCarnetWidget> {
  late PdfDechargeCarnetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfDechargeCarnetModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'pdfDechargeCarnet'});
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
          child: Container(
            width: 595.0,
            height: 841.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
