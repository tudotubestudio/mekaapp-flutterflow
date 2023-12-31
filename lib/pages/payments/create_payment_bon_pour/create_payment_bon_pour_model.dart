import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePaymentBonPourModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for atamt widget.
  TextEditingController? atamtController;
  String? Function(BuildContext, String?)? atamtControllerValidator;
  // Stores action output result for [Backend Call - API (updateBookLineLivreur)] action in Button widget.
  ApiCallResponse? apiResultcsc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    atamtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
