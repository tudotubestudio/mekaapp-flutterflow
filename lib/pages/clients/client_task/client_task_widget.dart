import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/tasks/rapport_route_months/rapport_route_months_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'client_task_model.dart';
export 'client_task_model.dart';

class ClientTaskWidget extends StatefulWidget {
  const ClientTaskWidget({
    Key? key,
    this.client,
    this.minChMonth,
  }) : super(key: key);

  final dynamic client;
  final double? minChMonth;

  @override
  _ClientTaskWidgetState createState() => _ClientTaskWidgetState();
}

class _ClientTaskWidgetState extends State<ClientTaskWidget> {
  late ClientTaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientTaskModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x20000000),
                  offset: Offset(0.0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              getJsonField(
                                widget.client,
                                r'''$.socreditstatus''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  widget.client,
                                  r'''$.name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 0.0, 0.0),
                              child: Text(
                                formatNumber(
                                  functions.toDouble(
                                      getJsonField(
                                        widget.client,
                                        r'''$.tot_echue_non_couvert''',
                                      ).toString(),
                                      false),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'DA ',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.list_alt,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'CLIENT_TASK_COMP_list_alt_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            enableDrag: false,
                            context: context,
                            builder: (bottomSheetContext) {
                              return Padding(
                                padding: MediaQuery.of(bottomSheetContext)
                                    .viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: RapportRouteMonthsWidget(
                                    cBpartnerId:
                                        functions.jsonToInt(getJsonField(
                                      widget.client,
                                      r'''$.c_bpartner_id''',
                                    )),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.chevron_right_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'CLIENT_TASK_chevron_right_sharp_ICN_ON_T');
                          logFirebaseEvent('IconButton_navigate_to');

                          context.pushNamed(
                            'Client',
                            queryParams: {
                              'client': serializeParam(
                                widget.client,
                                ParamType.JSON,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LinearPercentIndicator(
            percent: functions.percTwoNumMax1(
                functions.jsonToDouble(getJsonField(
                  widget.client,
                  r'''$.ch_0''',
                )),
                widget.minChMonth),
            lineHeight: 6.0,
            animation: true,
            progressColor: FlutterFlowTheme.of(context).primary,
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
