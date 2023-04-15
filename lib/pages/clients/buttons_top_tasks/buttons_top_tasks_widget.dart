import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buttons_top_tasks_model.dart';
export 'buttons_top_tasks_model.dart';

class ButtonsTopTasksWidget extends StatefulWidget {
  const ButtonsTopTasksWidget({Key? key}) : super(key: key);

  @override
  _ButtonsTopTasksWidgetState createState() => _ButtonsTopTasksWidgetState();
}

class _ButtonsTopTasksWidgetState extends State<ButtonsTopTasksWidget> {
  late ButtonsTopTasksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonsTopTasksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BUTTONS_TOP_TASKS_COMP_ALL_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed('ClientsAdmin');
                },
                text: 'All',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primary,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BUTTONS_TOP_TASKS_EN_COURS_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed('ClientsAdminEnCours');
                },
                text: 'En cours',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BUTTONS_TOP_TASKS_COMP_TODAY_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed('ClientsAdminToday');
                },
                text: 'Today',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).customColor1,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).customColor1,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BUTTONS_TOP_TASKS_COMP_NO_PAY_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed('ClientsAdminNoPay');
                },
                text: 'No pay',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).error,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
