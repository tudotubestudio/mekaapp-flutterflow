import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'track_real_ops_model.dart';
export 'track_real_ops_model.dart';

class TrackRealOpsWidget extends StatefulWidget {
  const TrackRealOpsWidget({Key? key}) : super(key: key);

  @override
  _TrackRealOpsWidgetState createState() => _TrackRealOpsWidgetState();
}

class _TrackRealOpsWidgetState extends State<TrackRealOpsWidget> {
  late TrackRealOpsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackRealOpsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrackRealOps'});
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Ma prime',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryBtnText,
                      unselectedLabelColor: Color(0xB3FFFFFF),
                      labelStyle: FlutterFlowTheme.of(context).titleMedium,
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      indicatorWeight: 3.0,
                      tabs: [
                        Tab(
                          text: 'Day',
                        ),
                        Tab(
                          text: 'Privistion',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: RealisationOpTodayCall.call(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final containerRealisationOpTodayResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x20000000),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.emoji_objects,
                                                        color:
                                                            Color(0xFFBDC3C7),
                                                        size: 24.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Chiffre day ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    '${formatNumber(
                                                      functions.toDouble(
                                                          getJsonField(
                                                            containerRealisationOpTodayResponse
                                                                .jsonBody,
                                                            r'''$[0].total''',
                                                          ).toString(),
                                                          false),
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    )} / ${formatNumber(
                                                      functions.toDouble(
                                                          getJsonField(
                                                            containerRealisationOpTodayResponse
                                                                .jsonBody,
                                                            r'''$[0].objectifop_poste_id''',
                                                          ).toString(),
                                                          false),
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    )} (${formatNumber(
                                                      functions.toDouble(
                                                          getJsonField(
                                                            containerRealisationOpTodayResponse
                                                                .jsonBody,
                                                            r'''$[0].perc''',
                                                          ).toString(),
                                                          false),
                                                      formatType:
                                                          FormatType.percent,
                                                    )})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child:
                                                          CircularPercentIndicator(
                                                        percent:
                                                            functions.toDouble(
                                                                getJsonField(
                                                                  containerRealisationOpTodayResponse
                                                                      .jsonBody,
                                                                  r'''$[0].perc''',
                                                                ).toString(),
                                                                true),
                                                        radius: 45.0,
                                                        lineWidth: 12.0,
                                                        animation: true,
                                                        progressColor:
                                                            Color(0xFF3498DB),
                                                        backgroundColor:
                                                            Color(0xFFF1F4F8),
                                                        center: Text(
                                                          formatNumber(
                                                            functions.toDouble(
                                                                getJsonField(
                                                                  containerRealisationOpTodayResponse
                                                                      .jsonBody,
                                                                  r'''$[0].perc''',
                                                                ).toString(),
                                                                false),
                                                            formatType:
                                                                FormatType
                                                                    .percent,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF3498DB),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              if (functions.toDouble(
                                                                      getJsonField(
                                                                        containerRealisationOpTodayResponse
                                                                            .jsonBody,
                                                                        r'''$[0].perc''',
                                                                      ).toString(),
                                                                      false) >=
                                                                  0.5)
                                                                Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFF27AE60),
                                                                  size: 24.0,
                                                                ),
                                                              if (functions.toDouble(
                                                                      getJsonField(
                                                                        containerRealisationOpTodayResponse
                                                                            .jsonBody,
                                                                        r'''$[0].perc''',
                                                                      ).toString(),
                                                                      false) <
                                                                  0.5)
                                                                Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFFBDC3C7),
                                                                  size: 24.0,
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '50 %',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '+${getJsonField(
                                                                    containerRealisationOpTodayResponse
                                                                        .jsonBody,
                                                                    r'''$[0].prime50''',
                                                                  ).toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF27AE60),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              if (functions.toDouble(
                                                                      getJsonField(
                                                                        containerRealisationOpTodayResponse
                                                                            .jsonBody,
                                                                        r'''$[0].perc''',
                                                                      ).toString(),
                                                                      false) >=
                                                                  0.8)
                                                                Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFF27AE60),
                                                                  size: 24.0,
                                                                ),
                                                              if (functions.toDouble(
                                                                      getJsonField(
                                                                        containerRealisationOpTodayResponse
                                                                            .jsonBody,
                                                                        r'''$[0].perc''',
                                                                      ).toString(),
                                                                      false) <
                                                                  0.8)
                                                                Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFFBDC3C7),
                                                                  size: 24.0,
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '80 %',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '+${getJsonField(
                                                                    containerRealisationOpTodayResponse
                                                                        .jsonBody,
                                                                    r'''$[0].prime80''',
                                                                  ).toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF27AE60),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              if (functions.toDouble(
                                                                      getJsonField(
                                                                        containerRealisationOpTodayResponse
                                                                            .jsonBody,
                                                                        r'''$[0].perc''',
                                                                      ).toString(),
                                                                      false) >=
                                                                  1.0)
                                                                Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFF27AE60),
                                                                  size: 24.0,
                                                                ),
                                                              if (functions.toDouble(
                                                                      getJsonField(
                                                                        containerRealisationOpTodayResponse
                                                                            .jsonBody,
                                                                        r'''$[0].perc''',
                                                                      ).toString(),
                                                                      false) <
                                                                  1.0)
                                                                Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xFFBDC3C7),
                                                                  size: 24.0,
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '100 %',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '+${getJsonField(
                                                                    containerRealisationOpTodayResponse
                                                                        .jsonBody,
                                                                    r'''$[0].prime100''',
                                                                  ).toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF27AE60),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        functions.toDouble(
                                                            getJsonField(
                                                              containerRealisationOpTodayResponse
                                                                  .jsonBody,
                                                              r'''$[0].prime''',
                                                            ).toString(),
                                                            false),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: 'DA ',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF27AE60),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter2 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(
                                                    RealisationLabosOpTodayCall
                                                        .call()))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final listViewRealisationLabosOpTodayResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final labos = getJsonField(
                                              listViewRealisationLabosOpTodayResponse
                                                  .jsonBody,
                                              r'''$''',
                                            ).toList();
                                            return RefreshIndicator(
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'TRACK_REAL_OPS_ListView_blpsmrlh_ON_PULL');
                                                logFirebaseEvent(
                                                    'ListView_refresh_database_request');
                                                setState(() => _model
                                                        .apiRequestCompleter2 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted2();
                                              },
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: labos.length,
                                                itemBuilder:
                                                    (context, labosIndex) {
                                                  final labosItem =
                                                      labos[labosIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x20000000),
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .business,
                                                                    color: Color(
                                                                        0xFFBDC3C7),
                                                                    size: 24.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${getJsonField(
                                                                        labosItem,
                                                                        r'''$.name''',
                                                                      ).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                '${formatNumber(
                                                                  functions.toDouble(
                                                                      getJsonField(
                                                                        labosItem,
                                                                        r'''$.total''',
                                                                      ).toString(),
                                                                      false),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .automatic,
                                                                )} / ${formatNumber(
                                                                  functions.toDouble(
                                                                      getJsonField(
                                                                        labosItem,
                                                                        r'''$.objectif''',
                                                                      ).toString(),
                                                                      false),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .automatic,
                                                                )} (${formatNumber(
                                                                  functions.toDouble(
                                                                      getJsonField(
                                                                        labosItem,
                                                                        r'''$.perc''',
                                                                      ).toString(),
                                                                      false),
                                                                  formatType:
                                                                      FormatType
                                                                          .percent,
                                                                )})',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      CircularPercentIndicator(
                                                                    percent: functions.toDouble(
                                                                        getJsonField(
                                                                          labosItem,
                                                                          r'''$.perc''',
                                                                        ).toString(),
                                                                        true),
                                                                    radius:
                                                                        45.0,
                                                                    lineWidth:
                                                                        12.0,
                                                                    animation:
                                                                        true,
                                                                    progressColor:
                                                                        Color(
                                                                            0xFFE67E22),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFF1F4F8),
                                                                    center:
                                                                        Text(
                                                                      formatNumber(
                                                                        functions.toDouble(
                                                                            getJsonField(
                                                                              labosItem,
                                                                              r'''$.perc''',
                                                                            ).toString(),
                                                                            false),
                                                                        formatType:
                                                                            FormatType.percent,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFFE67E22),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          if (functions.toDouble(
                                                                                  getJsonField(
                                                                                    labosItem,
                                                                                    r'''$.perc''',
                                                                                  ).toString(),
                                                                                  false) >=
                                                                              0.5)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFF27AE60),
                                                                              size: 24.0,
                                                                            ),
                                                                          if (functions.toDouble(
                                                                                  getJsonField(
                                                                                    labosItem,
                                                                                    r'''$.perc''',
                                                                                  ).toString(),
                                                                                  false) <
                                                                              0.5)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFFBDC3C7),
                                                                              size: 24.0,
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '50 %',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '+${getJsonField(
                                                                                labosItem,
                                                                                r'''$.prime50''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF27AE60),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          if (functions.toDouble(
                                                                                  getJsonField(
                                                                                    labosItem,
                                                                                    r'''$.perc''',
                                                                                  ).toString(),
                                                                                  false) >=
                                                                              0.8)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFF27AE60),
                                                                              size: 24.0,
                                                                            ),
                                                                          if (functions.toDouble(
                                                                                  getJsonField(
                                                                                    labosItem,
                                                                                    r'''$.perc''',
                                                                                  ).toString(),
                                                                                  false) <
                                                                              0.8)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFFBDC3C7),
                                                                              size: 24.0,
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '80 %',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '+${getJsonField(
                                                                                labosItem,
                                                                                r'''$.prime80''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF27AE60),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          if (functions.toDouble(
                                                                                  getJsonField(
                                                                                    labosItem,
                                                                                    r'''$.perc''',
                                                                                  ).toString(),
                                                                                  false) >=
                                                                              1.0)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFF27AE60),
                                                                              size: 24.0,
                                                                            ),
                                                                          if (functions.toDouble(
                                                                                  getJsonField(
                                                                                    labosItem,
                                                                                    r'''$.perc''',
                                                                                  ).toString(),
                                                                                  false) <
                                                                              1.0)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFFBDC3C7),
                                                                              size: 24.0,
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '100 %',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '+${getJsonField(
                                                                                labosItem,
                                                                                r'''$.prime100''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF27AE60),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  formatNumber(
                                                                    functions.toDouble(
                                                                        getJsonField(
                                                                          labosItem,
                                                                          r'''$.prime''',
                                                                        ).toString(),
                                                                        false),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                    currency:
                                                                        'DA ',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF27AE60),
                                                                      ),
                                                                ),
                                                              ],
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
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: RealisationOpMonthCall.call(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final containerRealisationOpMonthResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x20000000),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: Colors.white,
                                                        child:
                                                            ExpandableNotifier(
                                                          initialExpanded:
                                                              false,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .emoji_objects,
                                                                        color: Color(
                                                                            0xFFBDC3C7),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Chiffre month ',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).headlineMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions.toDouble(
                                                                              getJsonField(
                                                                                containerRealisationOpMonthResponse.jsonBody,
                                                                                r'''$[0].prime_privision''',
                                                                              ).toString(),
                                                                              false),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                          currency:
                                                                              'DA ',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF27AE60),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            collapsed:
                                                                Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        '${formatNumber(
                                                                          functions.toDouble(
                                                                              getJsonField(
                                                                                containerRealisationOpMonthResponse.jsonBody,
                                                                                r'''$[0].total''',
                                                                              ).toString(),
                                                                              false),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                        )} / ${formatNumber(
                                                                          functions.toDouble(
                                                                              getJsonField(
                                                                                containerRealisationOpMonthResponse.jsonBody,
                                                                                r'''$[0].objectif''',
                                                                              ).toString(),
                                                                              false),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                        )} (${formatNumber(
                                                                          functions.toDouble(
                                                                              getJsonField(
                                                                                containerRealisationOpMonthResponse.jsonBody,
                                                                                r'''$[0].perc''',
                                                                              ).toString(),
                                                                              false),
                                                                          formatType:
                                                                              FormatType.percent,
                                                                        )})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                    LinearPercentIndicator(
                                                                      percent: functions.toDouble(
                                                                          getJsonField(
                                                                            containerRealisationOpMonthResponse.jsonBody,
                                                                            r'''$[0].perc''',
                                                                          ).toString(),
                                                                          true),
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      lineHeight:
                                                                          10.0,
                                                                      animation:
                                                                          true,
                                                                      progressColor:
                                                                          Color(
                                                                              0xFFE67E22),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xFFF1F4F8),
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            expanded: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        CircularPercentIndicator(
                                                                      percent: functions.toDouble(
                                                                          getJsonField(
                                                                            containerRealisationOpMonthResponse.jsonBody,
                                                                            r'''$[0].perc''',
                                                                          ).toString(),
                                                                          true),
                                                                      radius:
                                                                          45.0,
                                                                      lineWidth:
                                                                          12.0,
                                                                      animation:
                                                                          true,
                                                                      progressColor:
                                                                          Color(
                                                                              0xFF3498DB),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xFFF1F4F8),
                                                                      center:
                                                                          Text(
                                                                        formatNumber(
                                                                          functions.toDouble(
                                                                              getJsonField(
                                                                                containerRealisationOpMonthResponse.jsonBody,
                                                                                r'''$[0].perc''',
                                                                              ).toString(),
                                                                              false),
                                                                          formatType:
                                                                              FormatType.percent,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF3498DB),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            if (functions.toDouble(
                                                                                    getJsonField(
                                                                                      containerRealisationOpMonthResponse.jsonBody,
                                                                                      r'''$[0].perc''',
                                                                                    ).toString(),
                                                                                    false) >=
                                                                                0.5)
                                                                              Icon(
                                                                                Icons.check_circle,
                                                                                color: Color(0xFF27AE60),
                                                                                size: 24.0,
                                                                              ),
                                                                            if (functions.toDouble(
                                                                                    getJsonField(
                                                                                      containerRealisationOpMonthResponse.jsonBody,
                                                                                      r'''$[0].perc''',
                                                                                    ).toString(),
                                                                                    false) <
                                                                                0.5)
                                                                              Icon(
                                                                                Icons.check_circle,
                                                                                color: Color(0xFFBDC3C7),
                                                                                size: 24.0,
                                                                              ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '50 %',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '+${getJsonField(
                                                                                  containerRealisationOpMonthResponse.jsonBody,
                                                                                  r'''$[0].perc''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF27AE60),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            if (functions.toDouble(
                                                                                    getJsonField(
                                                                                      containerRealisationOpMonthResponse.jsonBody,
                                                                                      r'''$[0].perc''',
                                                                                    ).toString(),
                                                                                    false) >=
                                                                                0.8)
                                                                              Icon(
                                                                                Icons.check_circle,
                                                                                color: Color(0xFF27AE60),
                                                                                size: 24.0,
                                                                              ),
                                                                            if (functions.toDouble(
                                                                                    getJsonField(
                                                                                      containerRealisationOpMonthResponse.jsonBody,
                                                                                      r'''$[0].perc''',
                                                                                    ).toString(),
                                                                                    false) <
                                                                                0.8)
                                                                              Icon(
                                                                                Icons.check_circle,
                                                                                color: Color(0xFFBDC3C7),
                                                                                size: 24.0,
                                                                              ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '80 %',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '+${getJsonField(
                                                                                  containerRealisationOpMonthResponse.jsonBody,
                                                                                  r'''$[0].perc''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF27AE60),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            if (functions.toDouble(
                                                                                    getJsonField(
                                                                                      containerRealisationOpMonthResponse.jsonBody,
                                                                                      r'''$[0].perc''',
                                                                                    ).toString(),
                                                                                    false) >=
                                                                                1.0)
                                                                              Icon(
                                                                                Icons.check_circle,
                                                                                color: Color(0xFF27AE60),
                                                                                size: 24.0,
                                                                              ),
                                                                            if (functions.toDouble(
                                                                                    getJsonField(
                                                                                      containerRealisationOpMonthResponse.jsonBody,
                                                                                      r'''$[0].perc''',
                                                                                    ).toString(),
                                                                                    false) <
                                                                                1.0)
                                                                              Icon(
                                                                                Icons.check_circle,
                                                                                color: Color(0xFFBDC3C7),
                                                                                size: 24.0,
                                                                              ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '100 %',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '+${getJsonField(
                                                                                  containerRealisationOpMonthResponse.jsonBody,
                                                                                  r'''$[0].perc''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF27AE60),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            theme:
                                                                ExpandableThemeData(
                                                              tapHeaderToExpand:
                                                                  true,
                                                              tapBodyToExpand:
                                                                  false,
                                                              tapBodyToCollapse:
                                                                  false,
                                                              headerAlignment:
                                                                  ExpandablePanelHeaderAlignment
                                                                      .center,
                                                              hasIcon: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter1 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(
                                                    RealisationLabosOpMonthCall
                                                        .call()))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final listViewRealisationLabosOpMonthResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final laboMonth = getJsonField(
                                              listViewRealisationLabosOpMonthResponse
                                                  .jsonBody,
                                              r'''$''',
                                            ).toList();
                                            return RefreshIndicator(
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'TRACK_REAL_OPS_ListView_6yxv2rfs_ON_PULL');
                                                logFirebaseEvent(
                                                    'ListView_refresh_database_request');
                                                setState(() => _model
                                                        .apiRequestCompleter1 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted1();
                                              },
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: laboMonth.length,
                                                itemBuilder:
                                                    (context, laboMonthIndex) {
                                                  final laboMonthItem =
                                                      laboMonth[laboMonthIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x20000000),
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .white,
                                                                    child:
                                                                        ExpandableNotifier(
                                                                      initialExpanded:
                                                                          false,
                                                                      child:
                                                                          ExpandablePanel(
                                                                        header:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 8.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.business,
                                                                                    color: Color(0xFFBDC3C7),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: AutoSizeText(
                                                                                        '${getJsonField(
                                                                                          laboMonthItem,
                                                                                          r'''$.name''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      formatNumber(
                                                                                        functions.toDouble(
                                                                                            getJsonField(
                                                                                              laboMonthItem,
                                                                                              r'''$.prime''',
                                                                                            ).toString(),
                                                                                            false),
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.automatic,
                                                                                        currency: 'DA ',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Color(0xFF27AE60),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        collapsed:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFEEEEEE),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                                                                                child: Text(
                                                                                  '${formatNumber(
                                                                                    functions.toDouble(
                                                                                        getJsonField(
                                                                                          laboMonthItem,
                                                                                          r'''$.total''',
                                                                                        ).toString(),
                                                                                        false),
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.automatic,
                                                                                  )} / ${formatNumber(
                                                                                    functions.toDouble(
                                                                                        getJsonField(
                                                                                          laboMonthItem,
                                                                                          r'''$.objectif''',
                                                                                        ).toString(),
                                                                                        false),
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.automatic,
                                                                                  )} (${formatNumber(
                                                                                    functions.toDouble(
                                                                                        getJsonField(
                                                                                          laboMonthItem,
                                                                                          r'''$.perc''',
                                                                                        ).toString(),
                                                                                        false),
                                                                                    formatType: FormatType.percent,
                                                                                  )})',
                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                ),
                                                                              ),
                                                                              LinearPercentIndicator(
                                                                                percent: functions.toDouble(
                                                                                    getJsonField(
                                                                                      laboMonthItem,
                                                                                      r'''$.perc''',
                                                                                    ).toString(),
                                                                                    true),
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                lineHeight: 10.0,
                                                                                animation: true,
                                                                                progressColor: Color(0xFFE67E22),
                                                                                backgroundColor: Color(0xFFF1F4F8),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        expanded:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: CircularPercentIndicator(
                                                                                  percent: functions.toDouble(
                                                                                      getJsonField(
                                                                                        laboMonthItem,
                                                                                        r'''$.perc''',
                                                                                      ).toString(),
                                                                                      true),
                                                                                  radius: 45.0,
                                                                                  lineWidth: 12.0,
                                                                                  animation: true,
                                                                                  progressColor: Color(0xFFE67E22),
                                                                                  backgroundColor: Color(0xFFF1F4F8),
                                                                                  center: Text(
                                                                                    formatNumber(
                                                                                      functions.toDouble(
                                                                                          getJsonField(
                                                                                            laboMonthItem,
                                                                                            r'''$.perc''',
                                                                                          ).toString(),
                                                                                          false),
                                                                                      formatType: FormatType.percent,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Color(0xFFE67E22),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        if (functions.toDouble(
                                                                                                getJsonField(
                                                                                                  laboMonthItem,
                                                                                                  r'''$.perc''',
                                                                                                ).toString(),
                                                                                                false) >=
                                                                                            0.5)
                                                                                          Icon(
                                                                                            Icons.check_circle,
                                                                                            color: Color(0xFF27AE60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        if (functions.toDouble(
                                                                                                getJsonField(
                                                                                                  laboMonthItem,
                                                                                                  r'''$.perc''',
                                                                                                ).toString(),
                                                                                                false) <
                                                                                            0.5)
                                                                                          Icon(
                                                                                            Icons.check_circle,
                                                                                            color: Color(0xFFBDC3C7),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '50 %',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '+${getJsonField(
                                                                                              laboMonthItem,
                                                                                              r'''$.prime50''',
                                                                                            ).toString()}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF27AE60),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        if (functions.toDouble(
                                                                                                getJsonField(
                                                                                                  laboMonthItem,
                                                                                                  r'''$.perc''',
                                                                                                ).toString(),
                                                                                                false) >=
                                                                                            0.8)
                                                                                          Icon(
                                                                                            Icons.check_circle,
                                                                                            color: Color(0xFF27AE60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        if (functions.toDouble(
                                                                                                getJsonField(
                                                                                                  laboMonthItem,
                                                                                                  r'''$.perc''',
                                                                                                ).toString(),
                                                                                                false) <
                                                                                            0.8)
                                                                                          Icon(
                                                                                            Icons.check_circle,
                                                                                            color: Color(0xFFBDC3C7),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '80 %',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '+${getJsonField(
                                                                                              laboMonthItem,
                                                                                              r'''$.prime80''',
                                                                                            ).toString()}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF27AE60),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        if (functions.toDouble(
                                                                                                getJsonField(
                                                                                                  laboMonthItem,
                                                                                                  r'''$.perc''',
                                                                                                ).toString(),
                                                                                                false) >=
                                                                                            1.0)
                                                                                          Icon(
                                                                                            Icons.check_circle,
                                                                                            color: Color(0xFF27AE60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        if (functions.toDouble(
                                                                                                getJsonField(
                                                                                                  laboMonthItem,
                                                                                                  r'''$.perc''',
                                                                                                ).toString(),
                                                                                                false) <
                                                                                            1.0)
                                                                                          Icon(
                                                                                            Icons.check_circle,
                                                                                            color: Color(0xFFBDC3C7),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '100 %',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '+${getJsonField(
                                                                                              laboMonthItem,
                                                                                              r'''$.prime100''',
                                                                                            ).toString()}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF27AE60),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        theme:
                                                                            ExpandableThemeData(
                                                                          tapHeaderToExpand:
                                                                              true,
                                                                          tapBodyToExpand:
                                                                              false,
                                                                          tapBodyToCollapse:
                                                                              false,
                                                                          headerAlignment:
                                                                              ExpandablePanelHeaderAlignment.center,
                                                                          hasIcon:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
