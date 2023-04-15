import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/tasks/create_list_prods/create_list_prods_widget.dart';
import '/pages/tasks/search_prods_gift/search_prods_gift_widget.dart';
import '/pages/tasks/search_prods_oblg/search_prods_oblg_widget.dart';
import '/pages/tasks/select_list_drop_down/select_list_drop_down_widget.dart';
import '/pages/tasks/select_user_drop_down/select_user_drop_down_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTaskModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownTypeTask widget.
  String? dropDownTypeTaskValue;
  FormFieldController<String>? dropDownTypeTaskValueController;
  // State field(s) for titleTask widget.
  TextEditingController? titleTaskController;
  String? Function(BuildContext, String?)? titleTaskControllerValidator;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for numPack widget.
  TextEditingController? numPackController;
  String? Function(BuildContext, String?)? numPackControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for SwitchListTileListProds widget.
  bool? switchListTileListProdsValue;
  // State field(s) for SwitchListTileRepeat widget.
  bool? switchListTileRepeatValue;
  // State field(s) for DropDownRepeat widget.
  String? dropDownRepeatValue;
  FormFieldController<String>? dropDownRepeatValueController;
  // State field(s) for day_month widget.
  TextEditingController? dayMonthController;
  String? Function(BuildContext, String?)? dayMonthControllerValidator;
  // State field(s) for CheckboxDay1 widget.
  bool? checkboxDay1Value;
  // State field(s) for CheckboxDay2 widget.
  bool? checkboxDay2Value;
  // State field(s) for CheckboxDay3 widget.
  bool? checkboxDay3Value;
  // State field(s) for CheckboxDay4 widget.
  bool? checkboxDay4Value;
  // State field(s) for CheckboxDay5 widget.
  bool? checkboxDay5Value;
  // State field(s) for CheckboxDay6 widget.
  bool? checkboxDay6Value;
  // State field(s) for CheckboxDay7 widget.
  bool? checkboxDay7Value;
  DateTime? datePicked3;
  // State field(s) for SwitchListTileProdsOblg widget.
  bool? switchListTileProdsOblgValue;
  // State field(s) for SwitchListTileObj1 widget.
  bool? switchListTileObj1Value;
  // State field(s) for objectif1 widget.
  TextEditingController? objectif1Controller;
  String? Function(BuildContext, String?)? objectif1ControllerValidator;
  // State field(s) for perc_real1 widget.
  TextEditingController? percReal1Controller;
  String? Function(BuildContext, String?)? percReal1ControllerValidator;
  // State field(s) for giftMoney1 widget.
  TextEditingController? giftMoney1Controller;
  String? Function(BuildContext, String?)? giftMoney1ControllerValidator;
  // State field(s) for percGiftMoney1 widget.
  TextEditingController? percGiftMoney1Controller;
  String? Function(BuildContext, String?)? percGiftMoney1ControllerValidator;
  // State field(s) for giftChiffre1 widget.
  TextEditingController? giftChiffre1Controller;
  String? Function(BuildContext, String?)? giftChiffre1ControllerValidator;
  // State field(s) for percGiftChiffre1 widget.
  TextEditingController? percGiftChiffre1Controller;
  String? Function(BuildContext, String?)? percGiftChiffre1ControllerValidator;
  // Stores action output result for [Custom Action - listJsonToString] action in Button widget.
  String? prodsOblgString;
  // Stores action output result for [Custom Action - listJsonToString] action in Button widget.
  String? prodsGiftsString;
  // Stores action output result for [Backend Call - API (task add)] action in Button widget.
  ApiCallResponse? rAddTask;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    titleTaskController?.dispose();
    descriptionController?.dispose();
    numPackController?.dispose();
    dayMonthController?.dispose();
    objectif1Controller?.dispose();
    percReal1Controller?.dispose();
    giftMoney1Controller?.dispose();
    percGiftMoney1Controller?.dispose();
    giftChiffre1Controller?.dispose();
    percGiftChiffre1Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
