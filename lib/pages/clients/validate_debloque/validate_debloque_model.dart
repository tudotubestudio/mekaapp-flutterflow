import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ValidateDebloqueModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for so_creditlimit widget.
  TextEditingController? soCreditlimitController;
  String? Function(BuildContext, String?)? soCreditlimitControllerValidator;
  DateTime? datePicked;
  // State field(s) for ReplaySuper widget.
  TextEditingController? replaySuperController;
  String? Function(BuildContext, String?)? replaySuperControllerValidator;
  // Stores action output result for [Backend Call - API (Update Task Client)] action in Button widget.
  ApiCallResponse? apiResult8iw;
  // Stores action output result for [Backend Call - API (Refuser Block)] action in Button widget.
  ApiCallResponse? apiResult8iwCopy;
  // Stores action output result for [Backend Call - API (paymentCheck)] action in Button widget.
  ApiCallResponse? apiResult8iwCopy2;
  // Stores action output result for [Backend Call - API (paymentCheck)] action in Button widget.
  ApiCallResponse? apiResult8iwCopy2Copy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    soCreditlimitController?.dispose();
    replaySuperController?.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
