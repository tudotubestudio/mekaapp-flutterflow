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
import 'clients_admin_no_pay_model.dart';
export 'clients_admin_no_pay_model.dart';

class ClientsAdminNoPayWidget extends StatefulWidget {
  const ClientsAdminNoPayWidget({Key? key}) : super(key: key);

  @override
  _ClientsAdminNoPayWidgetState createState() =>
      _ClientsAdminNoPayWidgetState();
}

class _ClientsAdminNoPayWidgetState extends State<ClientsAdminNoPayWidget> {
  late ClientsAdminNoPayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsAdminNoPayModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ClientsAdminNoPay'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CLIENTS_ADMIN_NO_PAY_arrow_back_rounded_');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('Main');
            },
          ),
          title: Text(
            'Admin',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.buttonsTopTasksModel,
                updateCallback: () => setState(() {}),
                child: ButtonsTopTasksWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => RefreshIndicator(
                      onRefresh: () async {
                        logFirebaseEvent(
                            'CLIENTS_ADMIN_NO_PAY_ListView_qnz87bau_O');
                        logFirebaseEvent('ListView_refresh_database_request');
                        setState(
                            () => _model.listViewPagingController?.refresh());
                        await _model.waitForOnePage();
                      },
                      child: PagedListView<ApiPagingParams, dynamic>(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) =>
                              ClientsGroup.tasksNoValidCall.call(
                            token:
                                valueOrDefault(currentUserDocument?.token, ''),
                            page: nextPageMarker.nextPageNumber,
                            sizePage: 30,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) => Image.asset(
                            'assets/images/7486744.png',
                          ),
                          itemBuilder: (context, _, taskIndex) {
                            final taskItem = _model
                                .listViewPagingController!.itemList![taskIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CLIENTS_ADMIN_NO_PAY_Container_fhluh3jc_');
                                logFirebaseEvent(
                                    'TaskOrdreDeblockageClient_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x00000000),
                                  barrierColor: Color(0x00000000),
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.75,
                                          child: ValidateDebloqueWidget(
                                            task: taskItem,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                logFirebaseEvent(
                                    'TaskOrdreDeblockageClient_refresh_databa');
                                setState(() =>
                                    _model.listViewPagingController?.refresh());
                                await _model.waitForOnePage();
                              },
                              child: TaskOrdreDeblockageClientWidget(
                                key: Key(
                                    'Keyfhl_${taskIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                task: taskItem,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
