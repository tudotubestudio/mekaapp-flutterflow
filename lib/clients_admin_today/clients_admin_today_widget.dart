import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/validate_debloque_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'clients_admin_today_model.dart';
export 'clients_admin_today_model.dart';

class ClientsAdminTodayWidget extends StatefulWidget {
  const ClientsAdminTodayWidget({Key? key}) : super(key: key);

  @override
  _ClientsAdminTodayWidgetState createState() =>
      _ClientsAdminTodayWidgetState();
}

class _ClientsAdminTodayWidgetState extends State<ClientsAdminTodayWidget> {
  late ClientsAdminTodayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsAdminTodayModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ClientsAdminToday'});
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
              logFirebaseEvent('CLIENTS_ADMIN_TODAY_arrow_back_rounded_I');
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CLIENTS_ADMIN_TODAY_EN_COURS_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('ClientsAdmin');
                      },
                      text: 'En cours',
                      options: FFButtonOptions(
                        width: 90.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CLIENTS_ADMIN_TODAY_TODAY_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('ClientsAdminToday');
                      },
                      text: 'Today',
                      options: FFButtonOptions(
                        width: 90.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CLIENTS_ADMIN_TODAY_NO_PAY_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('ClientsAdminNoPay');
                      },
                      text: 'No pay',
                      options: FFButtonOptions(
                        width: 90.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => RefreshIndicator(
                      onRefresh: () async {
                        logFirebaseEvent(
                            'CLIENTS_ADMIN_TODAY_ListView_8p8o9ktm_ON');
                        logFirebaseEvent('ListView_refresh_database_request');
                        setState(() => _model.pagingController?.refresh());
                        await _model.waitForOnePage();
                      },
                      child: PagedListView<ApiPagingParams, dynamic>(
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
                            ClientsGroup.tasksNoValidTodayCall
                                .call(
                              token: valueOrDefault(
                                  currentUserDocument?.token, ''),
                              page: nextPageMarker.nextPageNumber,
                              sizePage: 10,
                            )
                                .then((listViewTasksNoValidTodayResponse) {
                              final pageItems =
                                  ClientsGroup.tasksNoValidTodayCall
                                      .data(
                                        listViewTasksNoValidTodayResponse
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
                                            listViewTasksNoValidTodayResponse,
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

                          itemBuilder: (context, _, taskIndex) {
                            final taskItem =
                                _model.pagingController!.itemList![taskIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CLIENTS_ADMIN_TODAY_transaction_ON_TAP');
                                  if ((functions
                                              .jsonToDouble(getJsonField(
                                                taskItem,
                                                r'''$.status''',
                                              ))
                                              .toString() ==
                                          '0') &&
                                      valueOrDefault<bool>(
                                          currentUserDocument?.admin, false)) {
                                    logFirebaseEvent(
                                        'transaction_bottom_sheet');
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
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
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
                                        'transaction_refresh_database_request');
                                    setState(() =>
                                        _model.pagingController?.refresh());
                                    await _model.waitForOnePage();
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x35000000),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions
                                                .toDouble(
                                                    getJsonField(
                                                      taskItem,
                                                      r'''$.status''',
                                                    ).toString(),
                                                    false)
                                                .toString() ==
                                            '0')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Icon(
                                                  Icons.person_search_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (functions
                                                .toDouble(
                                                    getJsonField(
                                                      taskItem,
                                                      r'''$.status''',
                                                    ).toString(),
                                                    false)
                                                .toString() ==
                                            '1')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (functions
                                                .toDouble(
                                                    getJsonField(
                                                      taskItem,
                                                      r'''$.status''',
                                                    ).toString(),
                                                    false)
                                                .toString() ==
                                            '2')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (functions
                                                            .toDouble(
                                                                getJsonField(
                                                                  taskItem,
                                                                  r'''$.type''',
                                                                ).toString(),
                                                                false)
                                                            .toString() ==
                                                        '1')
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Deb',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (functions
                                                            .toDouble(
                                                                getJsonField(
                                                                  taskItem,
                                                                  r'''$.type''',
                                                                ).toString(),
                                                                false)
                                                            .toString() ==
                                                        '2')
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Aug',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (getJsonField(
                                                          taskItem,
                                                          r'''$.montant''',
                                                        ) !=
                                                        null)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            '${getJsonField(
                                                              taskItem,
                                                              r'''$.op''',
                                                            ).toString()}-${getJsonField(
                                                              taskItem,
                                                              r'''$.type_pay''',
                                                            ).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                if (getJsonField(
                                                      taskItem,
                                                      r'''$.montant''',
                                                    ) !=
                                                    null)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      getJsonField(
                                                        taskItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                if (getJsonField(
                                                      taskItem,
                                                      r'''$.montant''',
                                                    ) !=
                                                    null)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      'A: ${dateTimeFormat('d/M/y', functions.jsonToDate(getJsonField(
                                                            taskItem,
                                                            r'''$.date_pay''',
                                                          )))}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                if (getJsonField(
                                                      taskItem,
                                                      r'''$.disc''',
                                                    ) !=
                                                    null)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      getJsonField(
                                                        taskItem,
                                                        r'''$.disc''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              if (getJsonField(
                                                    taskItem,
                                                    r'''$.montant''',
                                                  ) !=
                                                  null)
                                                Text(
                                                  formatNumber(
                                                    functions.toDouble(
                                                        getJsonField(
                                                          taskItem,
                                                          r'''$.montant''',
                                                        ).toString(),
                                                        false),
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: 'DA ',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'relative',
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        taskItem,
                                                        r'''$.created_at''',
                                                      ).toString())),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    taskItem,
                                                    r'''$.updatedby''',
                                                  ).toString(),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
