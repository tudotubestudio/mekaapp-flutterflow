import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ValidateDebloqueModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for so_creditlimit widget.
  TextEditingController? soCreditlimitController;
  String? Function(BuildContext, String?)? soCreditlimitControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (Update Task Client)] action in Button widget.
  ApiCallResponse? apiResultk02;
  // Stores action output result for [Backend Call - API (Refuser Block)] action in Button widget.
  ApiCallResponse? apiResultk023;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    soCreditlimitController?.dispose();
  }

  /// Additional helper methods are added here.

}
