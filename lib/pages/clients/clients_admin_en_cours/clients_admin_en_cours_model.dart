import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/clients/buttons_top_tasks/buttons_top_tasks_widget.dart';
import '/pages/clients/task_ordre_deblockage_client/task_ordre_deblockage_client_widget.dart';
import '/pages/clients/validate_debloque/validate_debloque_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ClientsAdminEnCoursModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ButtonsTopTasks component.
  late ButtonsTopTasksModel buttonsTopTasksModel;
  // State field(s) for ListView widget.
  PagingController<ApiPagingParams, dynamic>? pagingController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonsTopTasksModel = createModel(context, () => ButtonsTopTasksModel());
  }

  void dispose() {
    buttonsTopTasksModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForOnePage({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (pagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
