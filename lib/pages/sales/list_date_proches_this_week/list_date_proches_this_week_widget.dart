import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'list_date_proches_this_week_model.dart';
export 'list_date_proches_this_week_model.dart';

class ListDateProchesThisWeekWidget extends StatefulWidget {
  const ListDateProchesThisWeekWidget({Key? key}) : super(key: key);

  @override
  _ListDateProchesThisWeekWidgetState createState() =>
      _ListDateProchesThisWeekWidgetState();
}

class _ListDateProchesThisWeekWidgetState
    extends State<ListDateProchesThisWeekWidget> {
  late ListDateProchesThisWeekModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListDateProchesThisWeekModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'List_date_proches_this_week'});
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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: FutureBuilder<ApiCallResponse>(
            future: DateProchesThisWeekCall.call(),
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
              final columnDateProchesThisWeekResponse = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Text(
                        'Initial value: ${formatNumber(
                          functions.sumSubTotal(
                              columnDateProchesThisWeekResponse.jsonBody),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        )} DA',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF3498DB),
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'LIST_DATE_PROCHES_THIS_WEEK_LOG_SELL_PRO');
                          logFirebaseEvent('Button_navigate_to');

                          context
                              .pushNamed('Log_products_date_proches_this_week');
                        },
                        text: 'Log sell products',
                        icon: Icon(
                          Icons.list,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 20.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: StatusScoreDateProcheCall.call(
                          targetId: 1,
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
                          final containerStatusScoreDateProcheResponse =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFF39C12),
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CircularPercentIndicator(
                                            percent: functions.percDateProcheOb(
                                                columnDateProchesThisWeekResponse
                                                    .jsonBody,
                                                getJsonField(
                                                  FFAppState().me,
                                                  r'''$.objectif_ca_oper''',
                                                ).toString(),
                                                FFAppState().percOb1),
                                            radius: 60.0,
                                            lineWidth: 24.0,
                                            animation: true,
                                            progressColor: Color(0xFFF39C12),
                                            backgroundColor: Color(0xFFF1F4F8),
                                            center: Text(
                                              formatNumber(
                                                functions.percDateProcheOb(
                                                    columnDateProchesThisWeekResponse
                                                        .jsonBody,
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().percOb1),
                                                formatType: FormatType.percent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFF39C12),
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Ob 1: ${formatNumber(
                                              functions.obDateProche1(
                                                  getJsonField(
                                                    FFAppState().me,
                                                    r'''$.objectif_ca_oper''',
                                                  ).toString(),
                                                  FFAppState().percOb1),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )} DA',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFF39C12),
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      if (containerStatusScoreDateProcheResponse
                                          .succeeded)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Lottie.asset(
                                              'assets/lottie_animations/99684-success-gif.json',
                                              width: 120.0,
                                              height: 110.0,
                                              fit: BoxFit.cover,
                                              repeat: false,
                                              animate: true,
                                            ),
                                            Text(
                                              '${formatNumber(
                                                functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb1),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )} DA',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFF39C12),
                                                      ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                if (functions.percDateProcheOb(
                                        columnDateProchesThisWeekResponse
                                            .jsonBody,
                                        getJsonField(
                                          FFAppState().me,
                                          r'''$.objectif_ca_oper''',
                                        ).toString(),
                                        FFAppState().percOb1) >=
                                    1.0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Visibility(
                                        visible:
                                            !containerStatusScoreDateProcheResponse
                                                .succeeded,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LIST_DATE_PROCHES_THIS_WEEK__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await AddScoreDateProcheCall.call(
                                                total: functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb1),
                                                targetId: 1,
                                              );
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Add Score Seccess',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF2ECC71),
                                                ),
                                              );
                                            },
                                            text: 'Get Score ${formatNumber(
                                              functions.obDateProche1(
                                                  getJsonField(
                                                    FFAppState().me,
                                                    r'''$.objectif_ca_oper''',
                                                  ).toString(),
                                                  FFAppState().scoreOb1),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )} DA',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFF39C12),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 20.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: StatusScoreDateProcheCall.call(
                          targetId: 2,
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
                          final containerStatusScoreDateProcheResponse =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFF3498DB),
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CircularPercentIndicator(
                                            percent: functions.percDateProcheOb(
                                                columnDateProchesThisWeekResponse
                                                    .jsonBody,
                                                getJsonField(
                                                  FFAppState().me,
                                                  r'''$.objectif_ca_oper''',
                                                ).toString(),
                                                FFAppState().percOb2),
                                            radius: 60.0,
                                            lineWidth: 24.0,
                                            animation: true,
                                            progressColor: Color(0xFF3498DB),
                                            backgroundColor: Color(0xFFF1F4F8),
                                            center: Text(
                                              formatNumber(
                                                functions.percDateProcheOb(
                                                    columnDateProchesThisWeekResponse
                                                        .jsonBody,
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().percOb2),
                                                formatType: FormatType.percent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF3498DB),
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Ob 2: ${formatNumber(
                                              functions.obDateProche1(
                                                  getJsonField(
                                                    FFAppState().me,
                                                    r'''$.objectif_ca_oper''',
                                                  ).toString(),
                                                  FFAppState().percOb2),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )} DA',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF3498DB),
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      if (containerStatusScoreDateProcheResponse
                                          .succeeded)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Lottie.asset(
                                              'assets/lottie_animations/99684-success-gif.json',
                                              width: 120.0,
                                              height: 110.0,
                                              fit: BoxFit.cover,
                                              repeat: false,
                                              animate: true,
                                            ),
                                            Text(
                                              '${formatNumber(
                                                functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb2),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )} DA',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF3498DB),
                                                      ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                if (functions.percDateProcheOb(
                                        columnDateProchesThisWeekResponse
                                            .jsonBody,
                                        getJsonField(
                                          FFAppState().me,
                                          r'''$.objectif_ca_oper''',
                                        ).toString(),
                                        FFAppState().percOb2) >=
                                    1.0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Visibility(
                                        visible:
                                            !containerStatusScoreDateProcheResponse
                                                .succeeded,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LIST_DATE_PROCHES_THIS_WEEK__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await AddScoreDateProcheCall.call(
                                                total: functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb2),
                                                targetId: 2,
                                              );
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Add Score Seccess',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF2ECC71),
                                                ),
                                              );
                                            },
                                            text: 'Get Score ${formatNumber(
                                              functions.obDateProche1(
                                                  getJsonField(
                                                    FFAppState().me,
                                                    r'''$.objectif_ca_oper''',
                                                  ).toString(),
                                                  FFAppState().scoreOb2),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )} DA',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF3498DB),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 20.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: StatusScoreDateProcheCall.call(
                          targetId: 3,
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
                          final containerStatusScoreDateProcheResponse =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFF2ECC71),
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CircularPercentIndicator(
                                            percent: functions.percDateProcheOb(
                                                columnDateProchesThisWeekResponse
                                                    .jsonBody,
                                                getJsonField(
                                                  FFAppState().me,
                                                  r'''$.objectif_ca_oper''',
                                                ).toString(),
                                                FFAppState().percOb3),
                                            radius: 60.0,
                                            lineWidth: 24.0,
                                            animation: true,
                                            progressColor: Color(0xFF2ECC71),
                                            backgroundColor: Color(0xFFF1F4F8),
                                            center: Text(
                                              formatNumber(
                                                functions.percDateProcheOb(
                                                    columnDateProchesThisWeekResponse
                                                        .jsonBody,
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().percOb3),
                                                formatType: FormatType.percent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF2ECC71),
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Ob 3: ${formatNumber(
                                              functions.obDateProche1(
                                                  getJsonField(
                                                    FFAppState().me,
                                                    r'''$.objectif_ca_oper''',
                                                  ).toString(),
                                                  FFAppState().percOb3),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )} DA',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF2ECC71),
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      if (containerStatusScoreDateProcheResponse
                                          .succeeded)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Lottie.asset(
                                              'assets/lottie_animations/99684-success-gif.json',
                                              width: 120.0,
                                              height: 110.0,
                                              fit: BoxFit.cover,
                                              repeat: false,
                                              animate: true,
                                            ),
                                            Text(
                                              '${formatNumber(
                                                functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb2),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )} DA',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF2ECC71),
                                                      ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                if (functions.percDateProcheOb(
                                        columnDateProchesThisWeekResponse
                                            .jsonBody,
                                        getJsonField(
                                          FFAppState().me,
                                          r'''$.objectif_ca_oper''',
                                        ).toString(),
                                        FFAppState().percOb3) >=
                                    1.0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Visibility(
                                        visible:
                                            !containerStatusScoreDateProcheResponse
                                                .succeeded,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LIST_DATE_PROCHES_THIS_WEEK__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await AddScoreDateProcheCall.call(
                                                total: functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb2),
                                                targetId: 3,
                                              );
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Add Score Seccess',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF2ECC71),
                                                ),
                                              );
                                            },
                                            text: 'Get Score ${formatNumber(
                                              functions.obDateProche1(
                                                  getJsonField(
                                                    FFAppState().me,
                                                    r'''$.objectif_ca_oper''',
                                                  ).toString(),
                                                  FFAppState().scoreOb3),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )} DA',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF2ECC71),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
