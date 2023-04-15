import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/ordres_missions/create_order_mission/create_order_mission_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'generate_orders_missions_model.dart';
export 'generate_orders_missions_model.dart';

class GenerateOrdersMissionsWidget extends StatefulWidget {
  const GenerateOrdersMissionsWidget({Key? key}) : super(key: key);

  @override
  _GenerateOrdersMissionsWidgetState createState() =>
      _GenerateOrdersMissionsWidgetState();
}

class _GenerateOrdersMissionsWidgetState
    extends State<GenerateOrdersMissionsWidget> {
  late GenerateOrdersMissionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateOrdersMissionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'GenerateOrdersMissions'});
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

    return AuthUserStreamWidget(
      builder: (context) => FutureBuilder<ApiCallResponse>(
        future: PaymentsGroup.listLivreursCall.call(
          token: valueOrDefault(currentUserDocument?.token, ''),
        ),
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
          final generateOrdersMissionsListLivreursResponse = snapshot.data!;
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                    logFirebaseEvent(
                        'GENERATE_ORDERS_MISSIONS_arrow_back_roun');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
                title: Text(
                  'Generate Ordres Missions',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
              body: FutureBuilder<ApiCallResponse>(
                future: PaymentsGroup.listVehiclesCall.call(
                  token: valueOrDefault(currentUserDocument?.token, ''),
                ),
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
                  final stackListVehiclesResponse = snapshot.data!;
                  return Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FutureBuilder<ApiCallResponse>(
                                future: OrderMissionGroup.listRegionCall.call(
                                  token: valueOrDefault(
                                      currentUserDocument?.token, ''),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  final rowListRegionResponse = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final region =
                                                OrderMissionGroup.listRegionCall
                                                        .data(
                                                          rowListRegionResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            return DataTable2(
                                              columns: [
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      'Region',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      'Livreur',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      'Action',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              rows: (region as Iterable)
                                                  .mapIndexed(
                                                      (regionIndex,
                                                              regionItem) =>
                                                          [
                                                            Text(
                                                              getJsonField(
                                                                regionItem,
                                                                r'''$.region''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                regionItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      60.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .zoom_in,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayIcon,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'GENERATE_ORDERS_MISSIONS_zoom_in_ICN_ON_');
                                                                    logFirebaseEvent(
                                                                        'IconButton_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (bottomSheetContext) {
                                                                        return GestureDetector(
                                                                          onTap: () =>
                                                                              FocusScope.of(context).requestFocus(_unfocusNode),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.of(bottomSheetContext).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height * 0.8,
                                                                              child: CreateOrderMissionWidget(
                                                                                region: regionItem,
                                                                                listLivreurs: generateOrdersMissionsListLivreursResponse.jsonBody,
                                                                                listVecules: stackListVehiclesResponse.jsonBody,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ]
                                                              .map((c) =>
                                                                  DataCell(c))
                                                              .toList())
                                                  .map((e) => DataRow(cells: e))
                                                  .toList(),
                                              headingRowColor:
                                                  MaterialStateProperty.all(
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                              ),
                                              headingRowHeight: 56.0,
                                              dataRowColor:
                                                  MaterialStateProperty.all(
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              dataRowHeight: 56.0,
                                              border: TableBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              dividerThickness: 1.0,
                                              showBottomBorder: false,
                                              minWidth: 49.0,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
