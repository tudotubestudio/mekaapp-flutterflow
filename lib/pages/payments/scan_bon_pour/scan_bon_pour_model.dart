import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanBonPourModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for lastNum widget.
  TextEditingController? lastNumController;
  String? Function(BuildContext, String?)? lastNumControllerValidator;
  var barcode = '';
  // State field(s) for numBon widget.
  TextEditingController? numBonController;
  String? Function(BuildContext, String?)? numBonControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    lastNumController?.dispose();
    numBonController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
