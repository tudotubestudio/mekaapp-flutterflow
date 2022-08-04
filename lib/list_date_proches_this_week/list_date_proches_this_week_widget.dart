import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../log_products_date_proches_this_week/log_products_date_proches_this_week_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ListDateProchesThisWeekWidget extends StatefulWidget {
  const ListDateProchesThisWeekWidget({Key? key}) : super(key: key);

  @override
  _ListDateProchesThisWeekWidgetState createState() =>
      _ListDateProchesThisWeekWidgetState();
}

class _ListDateProchesThisWeekWidgetState
    extends State<ListDateProchesThisWeekWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<ApiCallResponse>(
            future: DateProchesThisWeekCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Text(
                        'Initial value: ${formatNumber(
                          functions.sumSubTotal(
                              columnDateProchesThisWeekResponse.jsonBody),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        )} DA',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF3498DB),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LogProductsDateProchesThisWeekWidget(),
                            ),
                          );
                        },
                        text: 'Log sell products',
                        icon: Icon(
                          Icons.list,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 20),
                      child: FutureBuilder<ApiCallResponse>(
                        future: StatusScoreDateProcheCall.call(
                          targetId: 1,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final containerStatusScoreDateProcheResponse =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFFF39C12),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
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
                                            radius: 60,
                                            lineWidth: 24,
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
                                                      .bodyText1
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
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFF39C12),
                                                  fontSize: 16,
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
                                              width: 120,
                                              height: 110,
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
                                                      .bodyText1
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
                                        8, 0, 8, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
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
                                                  0, 8, 0, 8),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await AddScoreDateProcheCall.call(
                                                total: functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb1),
                                                targetId: 1,
                                              );
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
                                              width: 300,
                                              height: 40,
                                              color: Color(0xFFF39C12),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 20),
                      child: FutureBuilder<ApiCallResponse>(
                        future: StatusScoreDateProcheCall.call(
                          targetId: 2,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final containerStatusScoreDateProcheResponse =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFF3498DB),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
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
                                            radius: 60,
                                            lineWidth: 24,
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
                                                      .bodyText1
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
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF3498DB),
                                                  fontSize: 16,
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
                                              width: 120,
                                              height: 110,
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
                                                      .bodyText1
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
                                        8, 0, 8, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
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
                                                  0, 8, 0, 8),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await AddScoreDateProcheCall.call(
                                                total: functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb2),
                                                targetId: 2,
                                              );
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
                                              width: 300,
                                              height: 40,
                                              color: Color(0xFF3498DB),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 20),
                      child: FutureBuilder<ApiCallResponse>(
                        future: StatusScoreDateProcheCall.call(
                          targetId: 3,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final containerStatusScoreDateProcheResponse =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xFF2ECC71),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
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
                                            radius: 60,
                                            lineWidth: 24,
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
                                                      .bodyText1
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
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF2ECC71),
                                                  fontSize: 16,
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
                                              width: 120,
                                              height: 110,
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
                                                      .bodyText1
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
                                        8, 0, 8, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
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
                                                  0, 8, 0, 8),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await AddScoreDateProcheCall.call(
                                                total: functions.obDateProche1(
                                                    getJsonField(
                                                      FFAppState().me,
                                                      r'''$.objectif_ca_oper''',
                                                    ).toString(),
                                                    FFAppState().scoreOb2),
                                                targetId: 3,
                                              );
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
                                              width: 300,
                                              height: 40,
                                              color: Color(0xFF2ECC71),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
