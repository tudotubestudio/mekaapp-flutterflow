import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_pack_model.dart';
export 'show_pack_model.dart';

class ShowPackWidget extends StatefulWidget {
  const ShowPackWidget({
    Key? key,
    this.pack,
  }) : super(key: key);

  final dynamic pack;

  @override
  _ShowPackWidgetState createState() => _ShowPackWidgetState();
}

class _ShowPackWidgetState extends State<ShowPackWidget> {
  late ShowPackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowPackModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ShowPack'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () async {
            logFirebaseEvent('SHOW_PACK_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Pack',
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x32171717),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        widget.pack,
                                        r'''$.title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    formatNumber(
                                      functions.jsonToDouble(getJsonField(
                                        widget.pack,
                                        r'''$.obj1''',
                                      )),
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.automatic,
                                      currency: 'DA ',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 36.0,
                                          fontWeight: FontWeight.normal,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Orders',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(TaskOrdersPackByUserCall.call(
                                    packId: getJsonField(
                                      widget.pack,
                                      r'''$.id''',
                                    ),
                                    token: valueOrDefault(
                                        currentUserDocument?.token, ''),
                                  )))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          final listViewTaskOrdersPackByUserResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final order = getJsonField(
                                listViewTaskOrdersPackByUserResponse.jsonBody,
                                r'''$''',
                              ).toList();
                              return RefreshIndicator(
                                onRefresh: () async {
                                  logFirebaseEvent(
                                      'SHOW_PACK_ListView_iqgb7l0v_ON_PULL_TO_R');
                                  logFirebaseEvent(
                                      'ListView_refresh_database_request');
                                  setState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: order.length,
                                  itemBuilder: (context, orderIndex) {
                                    final orderItem = order[orderIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.92,
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          orderItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'relative',
                                                              functions.jsonToDate(
                                                                  getJsonField(
                                                                orderItem,
                                                                r'''$.created''',
                                                              ))),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        orderItem,
                                                        r'''$.totallines''',
                                                      ).toString(),
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF090F13),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (getJsonField(
                                                    orderItem,
                                                    r'''$.target_id_get''',
                                                  ) ==
                                                  null)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  icon: Icon(
                                                    Icons.cached,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'SHOW_PACK_PAGE_cached_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_backend_call');
                                                    _model.rCheckOrderPack =
                                                        await TaskCheckOrderPackCall
                                                            .call(
                                                      orderId: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          orderItem,
                                                          r'''$.c_order_id''',
                                                        ).toString(),
                                                        '0',
                                                      ),
                                                      packId: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          widget.pack,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        '0',
                                                      ),
                                                      token: valueOrDefault(
                                                          currentUserDocument
                                                              ?.token,
                                                          ''),
                                                    );
                                                    if ((_model.rCheckOrderPack
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'IconButton_navigate_to');

                                                      context.pushNamed(
                                                        'GetGiftTask',
                                                        queryParams: {
                                                          'task':
                                                              serializeParam(
                                                            widget.pack,
                                                            ParamType.JSON,
                                                          ),
                                                          'order':
                                                              serializeParam(
                                                            orderItem,
                                                            ParamType.JSON,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'IconButton_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            getJsonField(
                                                              (_model.rCheckOrderPack
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.error''',
                                                            ).toString(),
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Roboto',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBtnText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor3,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              if (getJsonField(
                                                    orderItem,
                                                    r'''$.target_id_get''',
                                                  ) !=
                                                  null)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  icon: Icon(
                                                    Icons.card_giftcard,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'SHOW_PACK_PAGE_card_giftcard_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_navigate_to');

                                                    context.pushNamed(
                                                      'GetGiftTask',
                                                      queryParams: {
                                                        'task': serializeParam(
                                                          widget.pack,
                                                          ParamType.JSON,
                                                        ),
                                                        'order': serializeParam(
                                                          orderItem,
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
