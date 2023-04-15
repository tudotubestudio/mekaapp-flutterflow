import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectCountReservedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for maxReserve widget.
  TextEditingController? maxReserveController;
  String? Function(BuildContext, String?)? maxReserveControllerValidator;
  // Stores action output result for [Backend Call - API (task reserved pack)] action in Button widget.
  ApiCallResponse? resReserve;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    maxReserveController?.dispose();
  }

  /// Additional helper methods are added here.

}
