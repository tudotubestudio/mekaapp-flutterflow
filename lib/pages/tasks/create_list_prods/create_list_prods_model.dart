import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateListProdsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownLabos widget.
  String? dropDownLabosValue;
  FormFieldController<String>? dropDownLabosValueController;
  // Stores action output result for [Backend Call - API (getSearchProductsActivePharma)] action in IconButton widget.
  ApiCallResponse? resProds;
  // State field(s) for nameList widget.
  TextEditingController? nameListController;
  String? Function(BuildContext, String?)? nameListControllerValidator;
  // State field(s) for keySearchList widget.
  TextEditingController? keySearchListController;
  String? Function(BuildContext, String?)? keySearchListControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Custom Action - listJsonToString] action in Button widget.
  String? listProdsSelectString;
  // Stores action output result for [Backend Call - API (task add list)] action in Button widget.
  ApiCallResponse? rAddList;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameListController?.dispose();
    keySearchListController?.dispose();
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
