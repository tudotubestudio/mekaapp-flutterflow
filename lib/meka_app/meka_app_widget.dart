import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meka_app_model.dart';
export 'meka_app_model.dart';

class MekaAppWidget extends StatefulWidget {
  const MekaAppWidget({Key? key}) : super(key: key);

  @override
  _MekaAppWidgetState createState() => _MekaAppWidgetState();
}

class _MekaAppWidgetState extends State<MekaAppWidget> {
  late MekaAppModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MekaAppModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MekaApp'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: FlutterFlowWebView(
          url: 'https://mekaapp.com/bcd/mekaapp/',
          bypass: false,
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          verticalScroll: true,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
