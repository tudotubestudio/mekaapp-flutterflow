import '/auth/auth_util.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateOrderMissionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Destination widget.
  TextEditingController? destinationController;
  String? Function(BuildContext, String?)? destinationControllerValidator;
  String? _destinationControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for Truck widget.
  TextEditingController? truckController;
  String? Function(BuildContext, String?)? truckControllerValidator;
  String? _truckControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for Accompagnateur widget.
  TextEditingController? accompagnateurController;
  String? Function(BuildContext, String?)? accompagnateurControllerValidator;
  // Stores action output result for [Backend Call - API (addOrdreMission)] action in Button widget.
  ApiCallResponse? resOrdreMission;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    destinationControllerValidator = _destinationControllerValidator;
    truckControllerValidator = _truckControllerValidator;
  }

  void dispose() {
    destinationController?.dispose();
    truckController?.dispose();
    accompagnateurController?.dispose();
  }

  /// Additional helper methods are added here.

}
