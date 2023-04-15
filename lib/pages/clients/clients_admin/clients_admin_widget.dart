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
import 'clients_admin_model.dart';
export 'clients_admin_model.dart';

class ClientsAdminWidget extends StatefulWidget {
  const ClientsAdminWidget({Key? key}) : super(key: key);

  @override
  _ClientsAdminWidgetState createState() => _ClientsAdminWidgetState();
}

class _ClientsAdminWidgetState extends State<ClientsAdminWidget> {
  late ClientsAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsAdminModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ClientsAdmin'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
              logFirebaseEvent('CLIENTS_ADMIN_arrow_back_rounded_ICN_ON_');
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
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: AuthUserStreamWidget(
                    builder: (context) =>
                        PagedListView<ApiPagingParams, dynamic>(
                      pagingController: () {
                        if (_model.pagingController != null) {
                          return _model.pagingController!;
                        }

                        _model.pagingController = PagingController(
                          firstPageKey: ApiPagingParams(
                            nextPageNumber: 0,
                            numItems: 0,
                            lastResponse: null,
                          ),
                        );
                        _model.pagingController!
                            .addPageRequestListener((nextPageMarker) {
                          ClientsGroup.tasksDebloqeClientsCall
                              .call(
                            token:
                                valueOrDefault(currentUserDocument?.token, ''),
                            page: valueOrDefault<int>(
                              nextPageMarker.nextPageNumber,
                              1,
                            ),
                            sizePage: 30,
                          )
                              .then((listViewTasksDebloqeClientsResponse) {
                            final pageItems =
                                ClientsGroup.tasksDebloqeClientsCall
                                    .data(
                                      listViewTasksDebloqeClientsResponse
                                          .jsonBody,
                                    )!
                                    .toList() as List;
                            final newNumItems =
                                nextPageMarker.numItems + pageItems.length;
                            _model.pagingController!.appendPage(
                              pageItems,
                              (pageItems.length > 0)
                                  ? ApiPagingParams(
                                      nextPageNumber:
                                          nextPageMarker.nextPageNumber + 1,
                                      numItems: newNumItems,
                                      lastResponse:
                                          listViewTasksDebloqeClientsResponse,
                                    )
                                  : null,
                            );
                          });
                        });
                        return _model.pagingController!;
                      }(),
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
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Image.asset(
                          'assets/images/7486744.png',
                        ),
                        itemBuilder: (context, _, taskIndex) {
                          final taskItem =
                              _model.pagingController!.itemList![taskIndex];
                          return InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'CLIENTS_ADMIN_Container_u2vkladu_ON_TAP');
                              logFirebaseEvent(
                                  'TaskOrdreDeblockageClient_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0x00000000),
                                barrierColor: Color(0x00000000),
                                enableDrag: false,
                                context: context,
                                builder: (bottomSheetContext) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.of(bottomSheetContext)
                                          .viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
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
                              setState(
                                  () => _model.pagingController?.refresh());
                              await _model.waitForOnePage();
                            },
                            child: TaskOrdreDeblockageClientWidget(
                              key: Key(
                                  'Keyu2v_${taskIndex}_of_${_model.pagingController!.itemList!.length}'),
                              task: taskItem,
                            ),
                          );
                        },
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
