import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (me)] action in MainCopy widget.
  ApiCallResponse? apiResultu97;
  // Stores action output result for [Custom Action - callLogs] action in MainCopy widget.
  List<dynamic>? calllog;
  // Stores action output result for [Custom Action - getLogCall] action in MainCopy widget.
  String? calllogString22;
  // Stores action output result for [Custom Action - listJsonToString] action in MainCopy widget.
  String? callLogString;
  // Stores action output result for [Backend Call - API (Log Call)] action in MainCopy widget.
  ApiCallResponse? apiResult77q;
  // Stores action output result for [Backend Call - API (Log Call)] action in Button widget.
  ApiCallResponse? apiResultz39;
  // Stores action output result for [Backend Call - API (Log Call)] action in Button widget.
  ApiCallResponse? apiResultz393;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {}

  /// Additional helper methods are added here.

}