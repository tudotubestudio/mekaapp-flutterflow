import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/tasks/list_global_chiffre/list_global_chiffre_widget.dart';
import '/pages/tasks/select_count_reserved/select_count_reserved_widget.dart';
import '/pages/tasks/show_prods/show_prods_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'tasks_model.dart';
export 'tasks_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget>
    with TickerProviderStateMixin {
  late TasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.7,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.7,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TasksModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Tasks'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF1F4F8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 40.0,
                      height: 40.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        currentUserPhoto,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                      indicatorColor: Color(0xFF3498DB),
                      tabs: [
                        Tab(
                          text: 'My day',
                        ),
                        Tab(
                          text: 'My week',
                        ),
                        Tab(
                          text: 'Gift',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FutureBuilder<ApiCallResponse>(
                                      future: TasksCall.call(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final dashboardMainCardTasksResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          height: 170.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF39C12),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5.0,
                                                color: Color(0x23000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
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
                                                        'Bonuses',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
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
                                                          'Total bonuses today',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0x9AFFFFFF),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          formatNumber(
                                                            functions.sumSubTotalPrime(
                                                                dashboardMainCardTasksResponse
                                                                    .jsonBody,
                                                                'total_primes'),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                            currency: 'DA ',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 32.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          formatNumber(
                                                            functions.sumSubTotalPrime(
                                                                dashboardMainCardTasksResponse
                                                                    .jsonBody,
                                                                'total_primes100'),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                            currency: 'DA ',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 32.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ).animateOnPageLoad(animationsMap[
                                                      'columnOnPageLoadAnimation1']!),
                                                ),
                                                CircularPercentIndicator(
                                                  percent: 0.55,
                                                  radius: 45.0,
                                                  lineWidth: 4.0,
                                                  animation: true,
                                                  progressColor: Colors.white,
                                                  backgroundColor:
                                                      Color(0x2B202529),
                                                  center: Text(
                                                    formatNumber(
                                                      functions.percTwoNum(
                                                          functions.sumSubTotalPrime(
                                                              dashboardMainCardTasksResponse
                                                                  .jsonBody,
                                                              'total_primes'),
                                                          functions.sumSubTotalPrime(
                                                              dashboardMainCardTasksResponse
                                                                  .jsonBody,
                                                              'total_primes100')),
                                                      formatType:
                                                          FormatType.percent,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'progressBarOnPageLoadAnimation1']!),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.trending_up_sharp,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'iconOnPageLoadAnimation1']!),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!);
                                      },
                                    ),
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(TasksCall.call(
                                                token: valueOrDefault(
                                                    currentUserDocument?.token,
                                                    ''),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewTasksResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final task = getJsonField(
                                            listViewTasksResponse.jsonBody,
                                            r'''$''',
                                          ).toList();
                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'TASKS_ListView_m35hyyvl_ON_PULL_TO_REFRE');
                                              logFirebaseEvent(
                                                  'ListView_refresh_database_request');
                                              setState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted();
                                            },
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: task.length,
                                              itemBuilder:
                                                  (context, taskIndex) {
                                                final taskItem =
                                                    task[taskIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (functions.jsonToInt(
                                                            getJsonField(
                                                          taskItem,
                                                          r'''$.type''',
                                                        )) ==
                                                        7)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Total primes',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            3.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'Prime Achat',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '/',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime100''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Prime Achat Day',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF101213),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Created At: ${dateTimeFormat('relative', functions.jsonToDate(getJsonField(
                                                                        taskItem,
                                                                        r'''$.created_at''',
                                                                      )))}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Colors.white,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Text(
                                                                                'Obj1: ${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.perc_real1''',
                                                                                  )),
                                                                                  formatType: FormatType.percent,
                                                                                )}${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.obj1''',
                                                                                  )),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                  currency: 'DA ',
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                              collapsed: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) >=
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) <
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFF57636C),
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.realisation1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF101213),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        ' of  ',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.obj1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_realisation1''',
                                                                                      )),
                                                                                      width: 310.0,
                                                                                      lineHeight: 8.0,
                                                                                      animation: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                                                                                      barRadius: Radius.circular(16.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              expanded: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.jsonToDouble(getJsonField(
                                                                                                        taskItem,
                                                                                                        r'''$.gift_money1''',
                                                                                                      )),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_money1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_money1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.gift_chiffre1''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_chiffre1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_chiffre1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_prods1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Products Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final prodsGifts1 = getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.list_gift_prods1''',
                                                                                                    ).toList();
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: prodsGifts1.length,
                                                                                                      itemBuilder: (context, prodsGifts1Index) {
                                                                                                        final prodsGifts1Item = prodsGifts1[prodsGifts1Index];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 5.0,
                                                                                                                  color: Color(0x3416202A),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                              shape: BoxShape.rectangle,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.quantity''',
                                                                                                                        ).toString(),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                      child: AutoSizeText(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.product.name''',
                                                                                                                        ).toString(),
                                                                                                                        maxLines: 2,
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                if (functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_realisation1''',
                                                                                                    )) >=
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_real1''',
                                                                                                    )))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: 'Get Products',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: double.infinity,
                                                                                                        height: 40.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Colors.white,
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                              ),
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
                                                      ),
                                                    if (functions.jsonToInt(
                                                            getJsonField(
                                                          taskItem,
                                                          r'''$.type''',
                                                        )) ==
                                                        8)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Total primes',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            3.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'Prime SUPRVISEUR',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '/',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime100''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Prime SUPRVISEUR Day',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF101213),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Created At: ${dateTimeFormat('relative', functions.jsonToDate(getJsonField(
                                                                        taskItem,
                                                                        r'''$.created_at''',
                                                                      )))}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Colors.white,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Text(
                                                                                'Obj1: ${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.perc_real1''',
                                                                                  )),
                                                                                  formatType: FormatType.percent,
                                                                                )}${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.obj1''',
                                                                                  )),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                  currency: 'DA ',
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                              collapsed: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) >=
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) <
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFF57636C),
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.realisation1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF101213),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        ' of  ',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.obj1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_realisation1''',
                                                                                      )),
                                                                                      width: 310.0,
                                                                                      lineHeight: 8.0,
                                                                                      animation: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                                                                                      barRadius: Radius.circular(16.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              expanded: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.jsonToDouble(getJsonField(
                                                                                                        taskItem,
                                                                                                        r'''$.gift_money1''',
                                                                                                      )),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_money1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_money1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.gift_chiffre1''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_chiffre1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_chiffre1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_prods1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Products Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final prodsGifts1 = getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.list_gift_prods1''',
                                                                                                    ).toList();
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: prodsGifts1.length,
                                                                                                      itemBuilder: (context, prodsGifts1Index) {
                                                                                                        final prodsGifts1Item = prodsGifts1[prodsGifts1Index];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 5.0,
                                                                                                                  color: Color(0x3416202A),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                              shape: BoxShape.rectangle,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.quantity''',
                                                                                                                        ).toString(),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                      child: AutoSizeText(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.product.name''',
                                                                                                                        ).toString(),
                                                                                                                        maxLines: 2,
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                if (functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_realisation1''',
                                                                                                    )) >=
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_real1''',
                                                                                                    )))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: 'Get Products',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: double.infinity,
                                                                                                        height: 40.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Colors.white,
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                              ),
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
                                                      ),
                                                    if (functions.jsonToInt(
                                                            getJsonField(
                                                          taskItem,
                                                          r'''$.type''',
                                                        )) ==
                                                        2)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Total primes',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            3.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'Prime chef des vents',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '/',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime100''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Prime chef des vents Day',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF101213),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Created At: ${dateTimeFormat('relative', functions.jsonToDate(getJsonField(
                                                                        taskItem,
                                                                        r'''$.created_at''',
                                                                      )))}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Colors.white,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Text(
                                                                                'Obj1: ${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.perc_real1''',
                                                                                  )),
                                                                                  formatType: FormatType.percent,
                                                                                )}${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.obj1''',
                                                                                  )),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                  currency: 'DA ',
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                              collapsed: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) >=
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) <
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFF57636C),
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.realisation1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF101213),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        ' of  ',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.obj1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_realisation1''',
                                                                                      )),
                                                                                      width: 310.0,
                                                                                      lineHeight: 8.0,
                                                                                      animation: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                                                                                      barRadius: Radius.circular(16.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              expanded: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.jsonToDouble(getJsonField(
                                                                                                        taskItem,
                                                                                                        r'''$.gift_money1''',
                                                                                                      )),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_money1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_money1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.gift_chiffre1''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_chiffre1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_chiffre1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_prods1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Products Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final prodsGifts1 = getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.list_gift_prods1''',
                                                                                                    ).toList();
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: prodsGifts1.length,
                                                                                                      itemBuilder: (context, prodsGifts1Index) {
                                                                                                        final prodsGifts1Item = prodsGifts1[prodsGifts1Index];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 5.0,
                                                                                                                  color: Color(0x3416202A),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                              shape: BoxShape.rectangle,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.quantity''',
                                                                                                                        ).toString(),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                      child: AutoSizeText(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.product.name''',
                                                                                                                        ).toString(),
                                                                                                                        maxLines: 2,
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                if (functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_realisation1''',
                                                                                                    )) >=
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_real1''',
                                                                                                    )))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: 'Get Products',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: double.infinity,
                                                                                                        height: 40.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Colors.white,
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                              ),
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
                                                      ),
                                                    if (functions.jsonToInt(
                                                            getJsonField(
                                                          taskItem,
                                                          r'''$.type''',
                                                        )) ==
                                                        5)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Total primes',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.total_primes100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            3.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'Prime Op',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '/',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime100''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Text(
                                                                            'Prime Op Day',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day''',
                                                                          )),
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
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '/',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF2ECC71),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        formatNumber(
                                                                          functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.prime_day100''',
                                                                          )),
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
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF101213),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Created At: ${dateTimeFormat('relative', functions.jsonToDate(getJsonField(
                                                                        taskItem,
                                                                        r'''$.created_at''',
                                                                      )))}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Colors.white,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Text(
                                                                                'Obj1: ${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.perc_real1''',
                                                                                  )),
                                                                                  formatType: FormatType.percent,
                                                                                )}${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.obj1''',
                                                                                  )),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                  currency: 'DA ',
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                              collapsed: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) >=
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation1''',
                                                                                          )) <
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_real1''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFF57636C),
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation1''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.realisation1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF101213),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        ' of  ',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.obj1''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_realisation1''',
                                                                                      )),
                                                                                      width: 310.0,
                                                                                      lineHeight: 8.0,
                                                                                      animation: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                                                                                      barRadius: Radius.circular(16.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              expanded: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.jsonToDouble(getJsonField(
                                                                                                        taskItem,
                                                                                                        r'''$.gift_money1''',
                                                                                                      )),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_money1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_money1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.gift_chiffre1''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_chiffre1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_chiffre1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_prods1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Products Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final prodsGifts1 = getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.list_gift_prods1''',
                                                                                                    ).toList();
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: prodsGifts1.length,
                                                                                                      itemBuilder: (context, prodsGifts1Index) {
                                                                                                        final prodsGifts1Item = prodsGifts1[prodsGifts1Index];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 5.0,
                                                                                                                  color: Color(0x3416202A),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                              shape: BoxShape.rectangle,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.quantity''',
                                                                                                                        ).toString(),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                      child: AutoSizeText(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.product.name''',
                                                                                                                        ).toString(),
                                                                                                                        maxLines: 2,
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                if (functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_realisation1''',
                                                                                                    )) >=
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_real1''',
                                                                                                    )))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: 'Get Products',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: double.infinity,
                                                                                                        height: 40.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Colors.white,
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                              ),
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
                                                      ),
                                                    if (functions.jsonToInt(
                                                            getJsonField(
                                                          taskItem,
                                                          r'''$.type''',
                                                        )) ==
                                                        6)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF16A085),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            3.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'Prime Op Labo',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '/',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF2ECC71),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        functions
                                                                            .jsonToDouble(getJsonField(
                                                                          taskItem,
                                                                          r'''$.prime100''',
                                                                        )),
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            'DA ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF101213),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Created At: ${dateTimeFormat('relative', functions.jsonToDate(getJsonField(
                                                                        taskItem,
                                                                        r'''$.created_at''',
                                                                      )))}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Resets Jun 30, 2022',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Colors.white,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Text(
                                                                                'Obj1: ${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.perc_realisation''',
                                                                                  )),
                                                                                  formatType: FormatType.percent,
                                                                                )}${formatNumber(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.objectif''',
                                                                                  )),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                  currency: 'DA ',
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                              ),
                                                                              collapsed: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.realisation''',
                                                                                          )) >=
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.objectif''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      if (functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.perc_realisation''',
                                                                                          )) <
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.objectif''',
                                                                                          )))
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFF57636C),
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x2B202529),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                taskItem,
                                                                                                r'''$.perc_realisation''',
                                                                                              )),
                                                                                              formatType: FormatType.percent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.realisation''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF101213),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        ' of  ',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          functions.jsonToDouble(getJsonField(
                                                                                            taskItem,
                                                                                            r'''$.objectif''',
                                                                                          )),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'DA ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: LinearPercentIndicator(
                                                                                      percent: functions.jsonToDoublePercMax1(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_realisation''',
                                                                                      )),
                                                                                      width: 310.0,
                                                                                      lineHeight: 8.0,
                                                                                      animation: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                                                                                      barRadius: Radius.circular(16.0),
                                                                                      padding: EdgeInsets.zero,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              expanded: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final labo = getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.labos''',
                                                                                      ).toList();
                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: labo.length,
                                                                                        itemBuilder: (context, laboIndex) {
                                                                                          final laboItem = labo[laboIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 90.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 4.0,
                                                                                                    color: Color(0x34090F13),
                                                                                                    offset: Offset(0.0, 2.0),
                                                                                                  )
                                                                                                ],
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              laboItem,
                                                                                                              r'''$.name''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: Color(0xFF101213),
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          formatNumber(
                                                                                                            functions.jsonToDouble(getJsonField(
                                                                                                              laboItem,
                                                                                                              r'''$.prime''',
                                                                                                            )),
                                                                                                            formatType: FormatType.decimal,
                                                                                                            decimalType: DecimalType.automatic,
                                                                                                            currency: 'DA ',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          '/',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          formatNumber(
                                                                                                            functions.jsonToDouble(getJsonField(
                                                                                                              laboItem,
                                                                                                              r'''$.prime100''',
                                                                                                            )),
                                                                                                            formatType: FormatType.decimal,
                                                                                                            decimalType: DecimalType.automatic,
                                                                                                            currency: 'DA ',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            formatNumber(
                                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                                laboItem,
                                                                                                                r'''$.realisation''',
                                                                                                              )),
                                                                                                              formatType: FormatType.decimal,
                                                                                                              decimalType: DecimalType.automatic,
                                                                                                              currency: 'DA ',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: Color(0xFF57636C),
                                                                                                                  fontSize: 14.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            '/',
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: Color(0xFF57636C),
                                                                                                                  fontSize: 14.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              formatNumber(
                                                                                                                functions.jsonToDouble(getJsonField(
                                                                                                                  laboItem,
                                                                                                                  r'''$.objectif''',
                                                                                                                )),
                                                                                                                formatType: FormatType.decimal,
                                                                                                                decimalType: DecimalType.automatic,
                                                                                                                currency: 'DA ',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: Color(0xFF57636C),
                                                                                                                    fontSize: 14.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            formatNumber(
                                                                                                              functions.jsonToDouble(getJsonField(
                                                                                                                laboItem,
                                                                                                                r'''$.perc_realisation''',
                                                                                                              )),
                                                                                                              formatType: FormatType.percent,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: Color(0xFF57636C),
                                                                                                                  fontSize: 14.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: LinearPercentIndicator(
                                                                                                        percent: functions.jsonToDoublePercMax1(getJsonField(
                                                                                                          laboItem,
                                                                                                          r'''$.perc_realisation''',
                                                                                                        )),
                                                                                                        width: MediaQuery.of(context).size.width * 0.75,
                                                                                                        lineHeight: 8.0,
                                                                                                        animation: true,
                                                                                                        progressColor: Color(0xFF4B39EF),
                                                                                                        backgroundColor: Color(0xFFE0E3E7),
                                                                                                        barRadius: Radius.circular(8.0),
                                                                                                        padding: EdgeInsets.zero,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.jsonToDouble(getJsonField(
                                                                                                        taskItem,
                                                                                                        r'''$.gift_money1''',
                                                                                                      )),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.perc_gift_money1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Money (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_money1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_money1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Money',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.gift_chiffre1''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: 70.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Chiffre Quota (${formatNumber(
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_gift_chiffre1''',
                                                                                                    )),
                                                                                                    formatType: FormatType.percent,
                                                                                                  )})',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      functions.multiplicationTwoNum(
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.perc_gift_chiffre1''',
                                                                                                          )),
                                                                                                          functions.jsonToDouble(getJsonField(
                                                                                                            taskItem,
                                                                                                            r'''$.realisation1''',
                                                                                                          ))),
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                      currency: 'DA ',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )) >=
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_real1''',
                                                                                            )))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Get Chiffre',
                                                                                              options: FFButtonOptions(
                                                                                                width: 130.0,
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                elevation: 2.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (functions.jsonToDouble(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_prods1''',
                                                                                      )) >
                                                                                      0.0)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                                                                                          child: Container(
                                                                                            width: 4.0,
                                                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Products Quota',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final prodsGifts1 = getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.list_gift_prods1''',
                                                                                                    ).toList();
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: prodsGifts1.length,
                                                                                                      itemBuilder: (context, prodsGifts1Index) {
                                                                                                        final prodsGifts1Item = prodsGifts1[prodsGifts1Index];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 5.0,
                                                                                                                  color: Color(0x3416202A),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                              shape: BoxShape.rectangle,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.quantity''',
                                                                                                                        ).toString(),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                      child: AutoSizeText(
                                                                                                                        getJsonField(
                                                                                                                          prodsGifts1Item,
                                                                                                                          r'''$.product.name''',
                                                                                                                        ).toString(),
                                                                                                                        maxLines: 2,
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                if (functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_realisation1''',
                                                                                                    )) >=
                                                                                                    functions.jsonToDouble(getJsonField(
                                                                                                      taskItem,
                                                                                                      r'''$.perc_real1''',
                                                                                                    )))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: 'Get Products',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: double.infinity,
                                                                                                        height: 40.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Colors.white,
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                              ),
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
                                                      ),
                                                    if (functions.jsonToInt(
                                                            getJsonField(
                                                          taskItem,
                                                          r'''$.type''',
                                                        )) ==
                                                        1)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF9B59B6),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            3.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          'Pack(${getJsonField(
                                                                            taskItem,
                                                                            r'''$.id''',
                                                                          ).toString()})',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
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
                                                                            AutoSizeText(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF101213),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    getJsonField(
                                                                      taskItem,
                                                                      r'''$.description''',
                                                                    ).toString(),
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Created: ${dateTimeFormat('relative', functions.jsonToDate(getJsonField(
                                                                        taskItem,
                                                                        r'''$.created_at''',
                                                                      )))}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Objectif: ${formatNumber(
                                                                    functions
                                                                        .jsonToInt(
                                                                            getJsonField(
                                                                      taskItem,
                                                                      r'''$.obj1''',
                                                                    )),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                    currency:
                                                                        'DA ',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        taskItem,
                                                                        r'''$.num_pack''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  height: 24.0,
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Wrap(
                                                                        spacing:
                                                                            2.0,
                                                                        runSpacing:
                                                                            2.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          Visibility(
                                                                            visible: functions.jsonToInt(getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.prods_oblg''',
                                                                                )) >
                                                                                0,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('TASKS_PAGE_Container_t3g3zuj2_ON_TAP');
                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                        child: Container(
                                                                                          height: MediaQuery.of(context).size.height * 0.5,
                                                                                          child: ShowProdsWidget(
                                                                                            prods: getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.list_prods_oblg''',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 24.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFD35400),
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4.0,
                                                                                        color: Color(0x2B202529),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                    child: Text(
                                                                                      'Prods Oblg',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Visibility(
                                                                            visible: functions.jsonToInt(getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.gift_prods1''',
                                                                                )) >
                                                                                0,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('TASKS_PAGE_Container_i6lyynn6_ON_TAP');
                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                        child: Container(
                                                                                          height: MediaQuery.of(context).size.height * 0.5,
                                                                                          child: ShowProdsWidget(
                                                                                            prods: getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.list_gift_prods1''',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 24.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF2ECC71),
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4.0,
                                                                                        color: Color(0x2B202529),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                    child: Text(
                                                                                      'Prods Gift',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Visibility(
                                                                            visible: functions.jsonToInt(getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.gift_money1''',
                                                                                )) >
                                                                                0,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF3498DB),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x2B202529),
                                                                                      offset: Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  shape: BoxShape.rectangle,
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      functions.jsonToInt(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_money1''',
                                                                                      )),
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.automatic,
                                                                                      currency: 'DA ',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Visibility(
                                                                            visible: functions.jsonToInt(getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.gift_chiffre1''',
                                                                                )) >
                                                                                0,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF1ABC9C),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x2B202529),
                                                                                      offset: Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  shape: BoxShape.rectangle,
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      functions.jsonToInt(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.gift_chiffre1''',
                                                                                      )),
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.automatic,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
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
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .grayIcon,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'TASKS_PAGE_arrow_forward_ios_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'ShowPack',
                                                                          queryParams:
                                                                              {
                                                                            'pack':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                taskItem,
                                                                                r'''$''',
                                                                              ),
                                                                              ParamType.JSON,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (getJsonField(
                                                                          taskItem,
                                                                          r'''$.packStatus.total''',
                                                                        ) !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            CircularPercentIndicator(
                                                                          percent:
                                                                              valueOrDefault<double>(
                                                                            functions.percTwoNum(
                                                                                valueOrDefault<double>(
                                                                                  functions.jsonToDouble(getJsonField(
                                                                                    taskItem,
                                                                                    r'''$.packStatus.total''',
                                                                                  )),
                                                                                  0.0,
                                                                                ),
                                                                                functions.jsonToDouble(getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.num_pack''',
                                                                                ))),
                                                                            0.0,
                                                                          ),
                                                                          radius:
                                                                              45.0,
                                                                          lineWidth:
                                                                              12.0,
                                                                          animation:
                                                                              true,
                                                                          progressColor:
                                                                              Color(0xFFE67E22),
                                                                          backgroundColor:
                                                                              Color(0xFFF1F4F8),
                                                                          center:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                taskItem,
                                                                                r'''$.packStatus.total''',
                                                                              ).toString(),
                                                                              '0',
                                                                            )}/${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                taskItem,
                                                                                r'''$.num_pack''',
                                                                              ).toString(),
                                                                              '0',
                                                                            )}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFFE67E22),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (getJsonField(
                                                                              taskItem,
                                                                              r'''$.packStatus.total''',
                                                                            ) !=
                                                                            null)
                                                                          Text(
                                                                            '${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                taskItem,
                                                                                r'''$.packStatus.total''',
                                                                              ).toString(),
                                                                              '0',
                                                                            )} Total Get',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        if (getJsonField(
                                                                              taskItem,
                                                                              r'''$.packStatus.reserved''',
                                                                            ) !=
                                                                            null)
                                                                          Text(
                                                                            '${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                taskItem,
                                                                                r'''$.packStatus.reserved''',
                                                                              ).toString(),
                                                                              '0',
                                                                            )} Reserve',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (functions.jsonToDouble(getJsonField(
                                                                              taskItem,
                                                                              r'''$.restTimeReserve''',
                                                                            )) <=
                                                                            0.0)
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('TASKS_PAGE_RESERVE_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                barrierColor: Color(0x00000000),
                                                                                context: context,
                                                                                builder: (bottomSheetContext) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: MediaQuery.of(context).size.height * 0.25,
                                                                                      child: SelectCountReservedWidget(
                                                                                        task: taskItem,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));

                                                                              logFirebaseEvent('Button_refresh_database_request');
                                                                              setState(() => _model.apiRequestCompleter = null);
                                                                              await _model.waitForApiRequestCompleted();
                                                                            },
                                                                            text:
                                                                                'Reserve',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 130.0,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Colors.white,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF3498DB),
                                                                                  ),
                                                                              elevation: 2.0,
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF3498DB),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        if (functions.jsonToDouble(getJsonField(
                                                                              taskItem,
                                                                              r'''$.restTimeReserve''',
                                                                            )) >
                                                                            0.0)
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('TASKS_PAGE_RESERVED_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_refresh_database_request');
                                                                              setState(() => _model.apiRequestCompleter = null);
                                                                              await _model.waitForApiRequestCompleted();
                                                                            },
                                                                            text:
                                                                                'Reserved(${getJsonField(
                                                                              taskItem,
                                                                              r'''$.reserved''',
                                                                            ).toString()})',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 130.0,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  ),
                                                                              elevation: 2.0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        if (functions.jsonToDouble(getJsonField(
                                                                              taskItem,
                                                                              r'''$.restTimeReserve''',
                                                                            )) >
                                                                            0.0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                8.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                  child: Container(
                                                                                    width: 40.0,
                                                                                    height: 20.0,
                                                                                    child: custom_widgets.TimerReserve(
                                                                                      width: 40.0,
                                                                                      height: 20.0,
                                                                                      time: functions.jsonToInt(getJsonField(
                                                                                        taskItem,
                                                                                        r'''$.restTimeReserve''',
                                                                                      )),
                                                                                      color: FlutterFlowTheme.of(context).customColor3,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
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
                          Material(
                            color: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 400.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 170.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2ECC71),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: Color(0x23000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Sales',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Total Sales Today',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0x9AFFFFFF),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '\$500.20',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontSize: 32.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ).animateOnPageLoad(animationsMap[
                                                  'columnOnPageLoadAnimation2']!),
                                            ),
                                            CircularPercentIndicator(
                                              percent: 0.55,
                                              radius: 45.0,
                                              lineWidth: 4.0,
                                              animation: true,
                                              progressColor: Colors.white,
                                              backgroundColor:
                                                  Color(0x2B202529),
                                              center: Text(
                                                '55%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'progressBarOnPageLoadAnimation2']!),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.trending_up_sharp,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ).animateOnPageLoad(animationsMap[
                                                    'iconOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TASKS_PAGE_Container_jl8tch6c_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (bottomSheetContext) {
                                                  return Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.75,
                                                      child:
                                                          ListGlobalChiffreWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Global chiffre',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF090F13),
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'DA 500',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF2ECC71),
                                                              ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Color(0xFF7C8791),
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Category Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Color(0xFF7C8791),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Category Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Color(0xFF7C8791),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 270.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'You quotes',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 28.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'You will find your quote options below.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 0.0, 12.0),
                                                child: Container(
                                                  width: 270.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x2B202529),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Company Name',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              size: 24.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Text(
                                                                '4.5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '(242)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      50.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                '\$194.25',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          34.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  '/mo',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Color(
                                                                    0xFFF1F4F8),
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    2.0,
                                                                buttonSize:
                                                                    44.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_forward_rounded,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .local_fire_department_sharp,
                                                              color: Color(
                                                                  0xFFFFA130),
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              '\$124.29 yearly savings',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 12.0),
                                                child: Container(
                                                  width: 270.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x2B202529),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Company Name',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              size: 24.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Text(
                                                                '4.5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '(242)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      50.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                '\$194.25',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          34.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  '/mo',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Color(
                                                                    0xFFF1F4F8),
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    2.0,
                                                                buttonSize:
                                                                    44.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_forward_rounded,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .local_fire_department_sharp,
                                                              color: Color(
                                                                  0xFFFFA130),
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              '\$124.29 yearly savings',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
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
                                StreamBuilder<List<GiftsRecord>>(
                                  stream: queryGiftsRecord(),
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
                                    List<GiftsRecord> listViewGiftsRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewGiftsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGiftsRecord =
                                            listViewGiftsRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 12.0,
                                                  color: Color(0x34000000),
                                                  offset: Offset(-2.0, 5.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 12.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 4.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF4B39EF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                            'Pending Order',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF4B39EF),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Estimated Pickup TIme',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
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
                                                              '4:00pm',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        32.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'Global Chiffre',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  formatNumber(
                                                                    listViewGiftsRecord
                                                                        .total!,
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
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
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
                                                                      4.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            '(4 items)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
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
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
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
