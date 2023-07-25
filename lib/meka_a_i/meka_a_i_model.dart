import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/table_chiffre_ops_day_widget.dart';
import '/components/table_my_quotas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MekaAIModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> messagesChat = [];
  void addToMessagesChat(dynamic item) => messagesChat.add(item);
  void removeFromMessagesChat(dynamic item) => messagesChat.remove(item);
  void removeAtIndexFromMessagesChat(int index) => messagesChat.removeAt(index);
  void updateMessagesChatAtIndex(int index, Function(dynamic) updateFn) =>
      messagesChat[index] = updateFn(messagesChat[index]);

  int? lastId;

  String? msgWait = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Chat Messages)] action in MekaAI widget.
  ApiCallResponse? apiResultisr;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Chat Messages Sync)] action in MekaAI widget.
  ApiCallResponse? apiResultmh5;
  // State field(s) for TextChat widget.
  TextEditingController? textChatController;
  String? Function(BuildContext, String?)? textChatControllerValidator;
  // Stores action output result for [Backend Call - API (Add Message)] action in TextChat widget.
  ApiCallResponse? addMessageRes;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    textChatController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
