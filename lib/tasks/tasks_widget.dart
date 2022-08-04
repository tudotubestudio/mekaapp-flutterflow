import '../add_task/add_task_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/list_global_chiffre_widget.dart';
import '../components/select_count_reserved_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../show_pack/show_pack_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? rGetChiffreQuota;
  ApiCallResponse? rGetChiffreQuotaPerc;
  ApiCallResponse? rGetProdsQuota;
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(40, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'progressBarOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-50, 0),
        scale: 0.7,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(40, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'progressBarOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-50, 0),
        scale: 0.7,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryBtnText,
          size: 24,
        ),
      ),
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 44, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 44,
                    icon: Icon(
                      Icons.menu_rounded,
                      color: Color(0xFF101213),
                      size: 24,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  Text(
                    'Hello,',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                      child: AuthUserStreamWidget(
                        child: Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: Container(
                      width: 40,
                      height: 40,
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
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
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
                                      16, 12, 16, 12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF39C12),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x23000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
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
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'Total Sales Today',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0x9AFFFFFF),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: Text(
                                                    '\$500.20',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 32,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ).animated([
                                              animationsMap[
                                                  'columnOnPageLoadAnimation1']!
                                            ]),
                                          ),
                                          CircularPercentIndicator(
                                            percent: 0.55,
                                            radius: 45,
                                            lineWidth: 4,
                                            animation: true,
                                            progressColor: Colors.white,
                                            backgroundColor: Color(0x2B202529),
                                            center: Text(
                                              '55%',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ).animated([
                                            animationsMap[
                                                'progressBarOnPageLoadAnimation1']!
                                          ]),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.trending_up_sharp,
                                                color: Colors.white,
                                                size: 24,
                                              ).animated([
                                                animationsMap[
                                                    'iconOnPageLoadAnimation1']!
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animated([
                                    animationsMap[
                                        'containerOnPageLoadAnimation1']!
                                  ]),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: (_apiRequestCompleter ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(TasksCall.call()))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
                                            setState(() =>
                                                _apiRequestCompleter = null);
                                            await waitForApiRequestCompleter();
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: task.length,
                                            itemBuilder: (context, taskIndex) {
                                              final taskItem = task[taskIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (functions.jsonToInt(
                                                          getJsonField(
                                                        taskItem,
                                                        r'''$.type''',
                                                      )) ==
                                                      1)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 12,
                                                                  20, 12),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x34090F13),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      16,
                                                                      12,
                                                                      12),
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
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        'Pack(${getJsonField(
                                                                          taskItem,
                                                                          r'''$.id''',
                                                                        ).toString()})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        getJsonField(
                                                                          taskItem,
                                                                          r'''$.title''',
                                                                        ).toString(),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF101213),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            4),
                                                                child:
                                                                    AutoSizeText(
                                                                  getJsonField(
                                                                    taskItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14,
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
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                height: 24,
                                                                thickness: 2,
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
                                                                    child: Wrap(
                                                                      spacing:
                                                                          2,
                                                                      runSpacing:
                                                                          2,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Visibility(
                                                                          visible: functions.jsonToInt(getJsonField(
                                                                                taskItem,
                                                                                r'''$.prods_oblg''',
                                                                              )) ==
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                2,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 24,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFD35400),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4,
                                                                                    color: Color(0x2B202529),
                                                                                    offset: Offset(0, 2),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                                                                                child: Text(
                                                                                  'Prods Oblg',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                                r'''$.gift_prods1''',
                                                                              )) ==
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                2,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 24,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF2ECC71),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4,
                                                                                    color: Color(0x2B202529),
                                                                                    offset: Offset(0, 2),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                                                                                child: Text(
                                                                                  'Prods Gift',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                                r'''$.gift_money1''',
                                                                              )) >
                                                                              0,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                2,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 24,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF3498DB),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4,
                                                                                    color: Color(0x2B202529),
                                                                                    offset: Offset(0, 2),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
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
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                2,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 24,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF1ABC9C),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4,
                                                                                    color: Color(0x2B202529),
                                                                                    offset: Offset(0, 2),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                                                                                child: Text(
                                                                                  formatNumber(
                                                                                    functions.jsonToInt(getJsonField(
                                                                                      taskItem,
                                                                                      r'''$.gift_chiffre1''',
                                                                                    )),
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.automatic,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                        30,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        60,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      size: 30,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              ShowPackWidget(
                                                                            pack:
                                                                                getJsonField(
                                                                              taskItem,
                                                                              r'''$''',
                                                                            ),
                                                                          ),
                                                                        ),
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
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
                                                                            45,
                                                                        lineWidth:
                                                                            12,
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                                              FlutterFlowTheme.of(context).bodyText1,
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
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.reserved''',
                                                                          )) ==
                                                                          0.0)
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: Container(
                                                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                                                    child: SelectCountReservedWidget(
                                                                                      task: taskItem,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                            setState(() =>
                                                                                _apiRequestCompleter = null);
                                                                            await waitForApiRequestCompleter();
                                                                          },
                                                                          text:
                                                                              'Reserve',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130,
                                                                            height:
                                                                                40,
                                                                            color:
                                                                                Colors.white,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFF3498DB),
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0xFF3498DB),
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      if (functions
                                                                              .jsonToDouble(getJsonField(
                                                                            taskItem,
                                                                            r'''$.reserved''',
                                                                          )) >
                                                                          0.0)
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() =>
                                                                                _apiRequestCompleter = null);
                                                                            await waitForApiRequestCompleter();
                                                                          },
                                                                          text:
                                                                              'Reserved(${getJsonField(
                                                                            taskItem,
                                                                            r'''$.reserved''',
                                                                          ).toString()})',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130,
                                                                            height:
                                                                                40,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
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
                                                  if (functions.jsonToInt(
                                                          getJsonField(
                                                        taskItem,
                                                        r'''$.type''',
                                                      )) ==
                                                      2)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 12,
                                                                  20, 12),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x34090F13),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      16,
                                                                      12,
                                                                      12),
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        'Global Chiffre',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        getJsonField(
                                                                          taskItem,
                                                                          r'''$.title''',
                                                                        ).toString(),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF101213),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'DA 0',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).grayIcon,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'DA 500',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF2ECC71),
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          AutoSizeText(
                                                                        getJsonField(
                                                                          taskItem,
                                                                          r'''$.description''',
                                                                        ).toString(),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 14,
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
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Resets Jun 30, 2022',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14,
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
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
                                                                                Text(
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
                                                                              style: FlutterFlowTheme.of(context).title3,
                                                                            ),
                                                                            collapsed:
                                                                                Column(
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
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4,
                                                                                              color: Color(0x2B202529),
                                                                                              offset: Offset(0, 2),
                                                                                            )
                                                                                          ],
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Text(
                                                                                          formatNumber(
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )),
                                                                                            formatType: FormatType.percent,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF57636C),
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4,
                                                                                              color: Color(0x2B202529),
                                                                                              offset: Offset(0, 2),
                                                                                            )
                                                                                          ],
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Text(
                                                                                          formatNumber(
                                                                                            functions.jsonToDouble(getJsonField(
                                                                                              taskItem,
                                                                                              r'''$.perc_realisation1''',
                                                                                            )),
                                                                                            formatType: FormatType.percent,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                                      style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF101213),
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      ' of  ',
                                                                                      style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF57636C),
                                                                                            fontSize: 18,
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
                                                                                      style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF57636C),
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: LinearPercentIndicator(
                                                                                    percent: functions.jsonToDouble(getJsonField(
                                                                                      taskItem,
                                                                                      r'''$.perc_realisation1''',
                                                                                    )),
                                                                                    width: 310,
                                                                                    lineHeight: 8,
                                                                                    animation: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).lineColor,
                                                                                    barRadius: Radius.circular(16),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            expanded:
                                                                                Column(
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                                                                                        child: Container(
                                                                                          width: 4,
                                                                                          height: 70,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Money',
                                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () {
                                                                                              print('Button pressed ...');
                                                                                            },
                                                                                            text: 'Get Money',
                                                                                            options: FFButtonOptions(
                                                                                              width: 130,
                                                                                              height: 40,
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                                                                                        child: Container(
                                                                                          width: 4,
                                                                                          height: 70,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
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
                                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () {
                                                                                              print('Button pressed ...');
                                                                                            },
                                                                                            text: 'Get Money',
                                                                                            options: FFButtonOptions(
                                                                                              width: 130,
                                                                                              height: 40,
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                                                                                        child: Container(
                                                                                          width: 4,
                                                                                          height: 70,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Chiffre Quota',
                                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    taskItem,
                                                                                                    r'''$.gift_chiffre1''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              rGetChiffreQuota = await TaskGetChiffreQuotaCall.call(
                                                                                                taskId: getJsonField(
                                                                                                  taskItem,
                                                                                                  r'''$.id''',
                                                                                                ),
                                                                                              );
                                                                                              if ((rGetChiffreQuota?.succeeded ?? true)) {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      getJsonField(
                                                                                                        (rGetChiffreQuota?.jsonBody ?? ''),
                                                                                                        r'''$.seccess''',
                                                                                                      ).toString(),
                                                                                                      style: GoogleFonts.getFont(
                                                                                                        'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      getJsonField(
                                                                                                        (rGetChiffreQuota?.jsonBody ?? ''),
                                                                                                        r'''$.error''',
                                                                                                      ).toString(),
                                                                                                      style: GoogleFonts.getFont(
                                                                                                        'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).customColor3,
                                                                                                  ),
                                                                                                );
                                                                                              }

                                                                                              setState(() {});
                                                                                            },
                                                                                            text: 'Get Chiffre',
                                                                                            options: FFButtonOptions(
                                                                                              width: 130,
                                                                                              height: 40,
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                                                                                        child: Container(
                                                                                          width: 4,
                                                                                          height: 70,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
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
                                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              rGetChiffreQuotaPerc = await TaskGetChiffreQuotaCall.call(
                                                                                                taskId: getJsonField(
                                                                                                  taskItem,
                                                                                                  r'''$.id''',
                                                                                                ),
                                                                                              );
                                                                                              if ((rGetChiffreQuotaPerc?.succeeded ?? true)) {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      getJsonField(
                                                                                                        (rGetChiffreQuotaPerc?.jsonBody ?? ''),
                                                                                                        r'''$.seccess''',
                                                                                                      ).toString(),
                                                                                                      style: GoogleFonts.getFont(
                                                                                                        'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      getJsonField(
                                                                                                        (rGetChiffreQuotaPerc?.jsonBody ?? ''),
                                                                                                        r'''$.error''',
                                                                                                      ).toString(),
                                                                                                      style: GoogleFonts.getFont(
                                                                                                        'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).customColor3,
                                                                                                  ),
                                                                                                );
                                                                                              }

                                                                                              setState(() {});
                                                                                            },
                                                                                            text: 'Get Chiffre',
                                                                                            options: FFButtonOptions(
                                                                                              width: 130,
                                                                                              height: 40,
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                                                                                        child: Container(
                                                                                          width: 4,
                                                                                          height: MediaQuery.of(context).size.height * 0.1,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Products Quota',
                                                                                                style: FlutterFlowTheme.of(context).subtitle2,
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
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 60,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            boxShadow: [
                                                                                                              BoxShadow(
                                                                                                                blurRadius: 5,
                                                                                                                color: Color(0x3416202A),
                                                                                                                offset: Offset(0, 2),
                                                                                                              )
                                                                                                            ],
                                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                                            shape: BoxShape.rectangle,
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 50,
                                                                                                                  height: 50,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                    shape: BoxShape.circle,
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                                    child: Text(
                                                                                                                      getJsonField(
                                                                                                                        prodsGifts1Item,
                                                                                                                        r'''$.quantity''',
                                                                                                                      ).toString(),
                                                                                                                      textAlign: TextAlign.center,
                                                                                                                      style: FlutterFlowTheme.of(context).title3,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      getJsonField(
                                                                                                                        prodsGifts1Item,
                                                                                                                        r'''$.product.name''',
                                                                                                                      ).toString(),
                                                                                                                      maxLines: 2,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText2,
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      rGetProdsQuota = await TaskGetProdsQuotaCall.call();
                                                                                                      if ((rGetProdsQuota?.succeeded ?? true)) {
                                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                                          SnackBar(
                                                                                                            content: Text(
                                                                                                              getJsonField(
                                                                                                                (rGetProdsQuota?.jsonBody ?? ''),
                                                                                                                r'''$.seccess''',
                                                                                                              ).toString(),
                                                                                                              style: GoogleFonts.getFont(
                                                                                                                'Roboto',
                                                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                              ),
                                                                                                            ),
                                                                                                            duration: Duration(milliseconds: 4000),
                                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                                          SnackBar(
                                                                                                            content: Text(
                                                                                                              getJsonField(
                                                                                                                (rGetProdsQuota?.jsonBody ?? ''),
                                                                                                                r'''$.error''',
                                                                                                              ).toString(),
                                                                                                              style: GoogleFonts.getFont(
                                                                                                                'Roboto',
                                                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                              ),
                                                                                                            ),
                                                                                                            duration: Duration(milliseconds: 4000),
                                                                                                            backgroundColor: FlutterFlowTheme.of(context).customColor3,
                                                                                                          ),
                                                                                                        );
                                                                                                      }

                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    text: 'Get Products',
                                                                                                    options: FFButtonOptions(
                                                                                                      width: double.infinity,
                                                                                                      height: 40,
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: Colors.white,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Colors.transparent,
                                                                                                        width: 1,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(8),
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
                                                                            theme:
                                                                                ExpandableThemeData(
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
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 12),
                                    child: Container(
                                      width: double.infinity,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2ECC71),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x23000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
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
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      'Total Sales Today',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0x9AFFFFFF),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Text(
                                                      '\$500.20',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontSize: 32,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ).animated([
                                                animationsMap[
                                                    'columnOnPageLoadAnimation2']!
                                              ]),
                                            ),
                                            CircularPercentIndicator(
                                              percent: 0.55,
                                              radius: 45,
                                              lineWidth: 4,
                                              animation: true,
                                              progressColor: Colors.white,
                                              backgroundColor:
                                                  Color(0x2B202529),
                                              center: Text(
                                                '55%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ).animated([
                                              animationsMap[
                                                  'progressBarOnPageLoadAnimation2']!
                                            ]),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.trending_up_sharp,
                                                  color: Colors.white,
                                                  size: 24,
                                                ).animated([
                                                  animationsMap[
                                                      'iconOnPageLoadAnimation2']!
                                                ]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animated([
                                      animationsMap[
                                          'containerOnPageLoadAnimation2']!
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
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
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 12, 16, 12),
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize: 16,
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
                                                              .bodyText1
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
                                                      size: 24,
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
                                                  0, 12, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 12, 16, 12),
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
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Color(0xFF7C8791),
                                                    size: 24,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 12, 16, 12),
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
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Color(0xFF7C8791),
                                                    size: 24,
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
                                      0, 4, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 270,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 0, 0),
                                          child: Text(
                                            'You quotes',
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 12),
                                          child: Text(
                                            'You will find your quote options below.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 14,
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
                                                    .fromSTEB(12, 12, 0, 12),
                                                child: Container(
                                                  width: 270,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x2B202529),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 12, 12),
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
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          16,
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
                                                              size: 24,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          4,
                                                                          0),
                                                              child: Text(
                                                                '4.5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          14,
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
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
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
                                                                  .fromSTEB(0,
                                                                      50, 0, 0),
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
                                                                    .title1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          34,
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
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Color(
                                                                    0xFFF1F4F8),
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 2,
                                                                buttonSize: 44,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_forward_rounded,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24,
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
                                                              size: 24,
                                                            ),
                                                            Text(
                                                              '\$124.29 yearly savings',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        14,
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
                                                    .fromSTEB(12, 12, 12, 12),
                                                child: Container(
                                                  width: 270,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x2B202529),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 12, 12),
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
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          16,
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
                                                              size: 24,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          4,
                                                                          0),
                                                              child: Text(
                                                                '4.5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          14,
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
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
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
                                                                  .fromSTEB(0,
                                                                      50, 0, 0),
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
                                                                    .title1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          34,
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
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Color(
                                                                    0xFFF1F4F8),
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 2,
                                                                buttonSize: 44,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_forward_rounded,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24,
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
                                                              size: 24,
                                                            ),
                                                            Text(
                                                              '\$124.29 yearly savings',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        14,
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
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
                                                  16, 12, 16, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 12,
                                                  color: Color(0x34000000),
                                                  offset: Offset(-2, 5),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 12, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 4,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF4B39EF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 0, 0),
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
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF4B39EF),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Estimated Pickup TIme',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '4:00pm',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        32,
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
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
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
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 4),
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
                                                                            4,
                                                                            4,
                                                                            0,
                                                                            0),
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
                                                                      .title3
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            20,
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
                                                                  .fromSTEB(0,
                                                                      4, 0, 8),
                                                          child: Text(
                                                            '(4 items)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 14,
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

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
