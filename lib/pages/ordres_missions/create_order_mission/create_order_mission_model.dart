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
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateOrderMissionModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  DateTime? dateStart;

  DateTime? dateEnd;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Destination widget.
  TextEditingController? destinationController1;
  String? Function(BuildContext, String?)? destinationController1Validator;
  // State field(s) for Livreur widget.
  String? livreurValue;
  FormFieldController<String>? livreurValueController;
  // State field(s) for Vecule widget.
  String? veculeValue;
  FormFieldController<String>? veculeValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Destination widget.
  TextEditingController? destinationController2;
  String? Function(BuildContext, String?)? destinationController2Validator;
  String? _destinationController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for WithLivreur widget.
  String? withLivreurValue;
  FormFieldController<String>? withLivreurValueController;
  // Stores action output result for [Backend Call - API (addOrdreMission)] action in Button widget.
  ApiCallResponse? resOrdreMission;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    destinationController2Validator = _destinationController2Validator;
  }

  void dispose() {
    destinationController1?.dispose();
    destinationController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
