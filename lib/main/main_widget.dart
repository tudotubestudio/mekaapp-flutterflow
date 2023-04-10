import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_PAGE_Main_ON_INIT_STATE');
      logFirebaseEvent('Main_backend_call');
      _model.apiResultu97 = await AuthGroup.meCall.call(
        token: valueOrDefault(currentUserDocument?.token, ''),
      );
      if ((_model.apiResultu97?.succeeded ?? true)) {
        logFirebaseEvent('Main_update_app_state');
        FFAppState().update(() {
          FFAppState().me = (_model.apiResultu97?.jsonBody ?? '');
        });
      } else {
        logFirebaseEvent('Main_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'no',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).customColor3,
          ),
        );
      }

      if (isAndroid) {
        logFirebaseEvent('Main_custom_action');
        _model.calllog = await actions.callLogs();
        logFirebaseEvent('Main_custom_action');
        _model.calllogString22 = await actions.getLogCall();
        logFirebaseEvent('Main_wait__delay');
        await Future.delayed(const Duration(milliseconds: 5000));
        logFirebaseEvent('Main_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'After 5s',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        logFirebaseEvent('Main_custom_action');
        _model.callLogString = await actions.listJsonToString(
          _model.calllog!.toList(),
        );
        logFirebaseEvent('Main_update_app_state');
        setState(() {
          FFAppState().dataString = _model.callLogString!;
        });
        logFirebaseEvent('Main_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _model.callLogString!,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        logFirebaseEvent('Main_backend_call');
        _model.apiResult77q = await ClientsGroup.logCallCall.call(
          data: _model.callLogString,
          token: valueOrDefault(currentUserDocument?.token, ''),
        );
        if ((_model.apiResult77q?.succeeded ?? true)) {
          logFirebaseEvent('Main_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sync ok',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        } else {
          logFirebaseEvent('Main_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sync no',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }
      }
    });

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).grayIcon,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MAIN_PAGE_LOG_IN_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('SignIn');
                  },
                  text: 'Log In',
                  options: FFButtonOptions(
                    width: double.infinity,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF95A5A6),
                          fontSize: 20.0,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Color(0xFFBDC3C7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MAIN_PAGE_LOG_OUT_BTN_ON_TAP');
                    logFirebaseEvent('Button_auth');
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('SignIn', mounted);
                  },
                  text: 'Log Out',
                  options: FFButtonOptions(
                    width: double.infinity,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF95A5A6),
                          fontSize: 20.0,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Color(0xFFBDC3C7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              if (valueOrDefault<bool>(currentUserDocument?.admin, false) ==
                  true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('MAIN_PAGE_ADD_TASK_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('addTask');
                      },
                      text: 'Add Task',
                      options: FFButtonOptions(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF95A5A6),
                                  fontSize: 20.0,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Color(0xFFBDC3C7),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(currentUserDocument?.admin, false) ==
                  true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('MAIN_PAGE_ORDRE_MISSION_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('LogsOrdreMissions');
                      },
                      text: 'Ordre Mission',
                      options: FFButtonOptions(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF95A5A6),
                                  fontSize: 20.0,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Color(0xFFBDC3C7),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              logFirebaseEvent('MAIN_PAGE_Icon_f2v1pdx8_ON_TAP');
              logFirebaseEvent('Icon_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          title: Text(
            'BcdPharma v8.1.5',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MAIN_PAGE_STORE_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('MekaApp');
                    },
                    text: 'Store',
                    options: FFButtonOptions(
                      width: double.infinity,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF95A5A6),
                                fontSize: 20.0,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xFFBDC3C7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MAIN_PAGE_COMPIERE_BTN_ON_TAP');
                      logFirebaseEvent('Button_launch_u_r_l');
                      await launchURL(
                          'http://105.96.12.183:2080/webui/index.zul');
                    },
                    text: 'Compiere',
                    options: FFButtonOptions(
                      width: double.infinity,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF95A5A6),
                                fontSize: 20.0,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xFFBDC3C7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MAIN_PAGE_NEW_TASKS_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('Clients');
                    },
                    text: 'New Tasks',
                    options: FFButtonOptions(
                      width: double.infinity,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF95A5A6),
                                fontSize: 20.0,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xFFBDC3C7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MAIN_PAGE_TASKS_ADMIN_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('ClientsAdmin');
                    },
                    text: 'Tasks Admin',
                    options: FFButtonOptions(
                      width: double.infinity,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF95A5A6),
                                fontSize: 20.0,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xFFBDC3C7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MAIN_PAGE_BUTTON_BTN_ON_TAP');
                    if (functions.convertListJsonToString(
                                _model.calllog!.toList()) !=
                            null &&
                        functions.convertListJsonToString(
                                _model.calllog!.toList()) !=
                            '') {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Not empty',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'empty',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    logFirebaseEvent('Button_backend_call');
                    _model.apiResultz39 = await ClientsGroup.logCallCall.call(
                      data: functions
                          .convertListJsonToString(_model.calllog!.toList()),
                      token: valueOrDefault(currentUserDocument?.token, ''),
                    );
                    if ((_model.apiResultz39?.succeeded ?? true)) {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'seccess',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'error',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: 'Button',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MAIN_PAGE_BUTTON_BTN_ON_TAP');
                    if (_model.calllogString22 != null &&
                        _model.calllogString22 != '') {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _model.calllogString22!,
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'empty',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    logFirebaseEvent('Button_backend_call');
                    _model.apiResultz393 = await ClientsGroup.logCallCall.call(
                      data: _model.calllogString22,
                      token: valueOrDefault(currentUserDocument?.token, ''),
                    );
                    if ((_model.apiResultz393?.succeeded ?? true)) {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'seccess',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'error',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: 'Button',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Text(
                  FFAppState().dataString,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                if (isAndroid && (_model.calllog!.length > 1))
                  Container(
                    width: double.infinity,
                    height: 500.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        final log = _model.calllog!.toList();
                        return DataTable2(
                          columns: [
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'Edit Header 1',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'Edit Header 2',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                          ],
                          rows: (log as Iterable)
                              .mapIndexed((logIndex, logItem) => [
                                    Text(
                                      getJsonField(
                                        logItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                    Text(
                                      getJsonField(
                                        logItem,
                                        r'''$.number''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ].map((c) => DataCell(c)).toList())
                              .map((e) => DataRow(cells: e))
                              .toList(),
                          headingRowColor: MaterialStateProperty.all(
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          headingRowHeight: 56.0,
                          dataRowColor: MaterialStateProperty.all(
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          dataRowHeight: 56.0,
                          border: TableBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          dividerThickness: 1.0,
                          showBottomBorder: false,
                          minWidth: 49.0,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
