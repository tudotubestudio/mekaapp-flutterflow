import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (me)] action in Main widget.
  ApiCallResponse? apiResultu97;
  // Stores action output result for [Custom Action - callLogs] action in Main widget.
  List<dynamic>? calllog;
  // Stores action output result for [Custom Action - getLogCall] action in Main widget.
  String? calllogString22;
  // Stores action output result for [Custom Action - listJsonToString] action in Main widget.
  String? callLogString;
  // Stores action output result for [Backend Call - API (Log Call)] action in Main widget.
  ApiCallResponse? apiResult77q;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
