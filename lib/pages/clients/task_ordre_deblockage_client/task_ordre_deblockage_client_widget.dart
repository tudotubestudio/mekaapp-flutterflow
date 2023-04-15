import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_ordre_deblockage_client_model.dart';
export 'task_ordre_deblockage_client_model.dart';

class TaskOrdreDeblockageClientWidget extends StatefulWidget {
  const TaskOrdreDeblockageClientWidget({
    Key? key,
    this.task,
  }) : super(key: key);

  final dynamic task;

  @override
  _TaskOrdreDeblockageClientWidgetState createState() =>
      _TaskOrdreDeblockageClientWidgetState();
}

class _TaskOrdreDeblockageClientWidgetState
    extends State<TaskOrdreDeblockageClientWidget> {
  late TaskOrdreDeblockageClientModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskOrdreDeblockageClientModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x35000000),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (functions
                      .jsonToDouble(getJsonField(
                        widget.task,
                        r'''$.exist_pay''',
                      ))
                      .toString() ==
                  '0')
                SizedBox(
                  height: 100.0,
                  child: VerticalDivider(
                    width: 4.0,
                    thickness: 4.0,
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
              if (functions
                      .jsonToDouble(getJsonField(
                        widget.task,
                        r'''$.exist_pay''',
                      ))
                      .toString() !=
                  '0')
                SizedBox(
                  height: 100.0,
                  child: VerticalDivider(
                    width: 4.0,
                    thickness: 4.0,
                    color: FlutterFlowTheme.of(context).success,
                  ),
                ),
              if (functions
                      .toDouble(
                          getJsonField(
                            widget.task,
                            r'''$.status''',
                          ).toString(),
                          false)
                      .toString() ==
                  '0')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).tertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Icon(
                        Icons.person_search_sharp,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              if (functions
                      .toDouble(
                          getJsonField(
                            widget.task,
                            r'''$.status''',
                          ).toString(),
                          false)
                      .toString() ==
                  '1')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              if (functions
                      .toDouble(
                          getJsonField(
                            widget.task,
                            r'''$.status''',
                          ).toString(),
                          false)
                      .toString() ==
                  '2')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).customColor3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (functions
                                  .toDouble(
                                      getJsonField(
                                        widget.task,
                                        r'''$.type''',
                                      ).toString(),
                                      false)
                                  .toString() ==
                              '1')
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(8.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: Text(
                                  'Deb',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          if (functions
                                  .toDouble(
                                      getJsonField(
                                        widget.task,
                                        r'''$.type''',
                                      ).toString(),
                                      false)
                                  .toString() ==
                              '2')
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(8.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: Text(
                                  'Aug',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          if (getJsonField(
                                widget.task,
                                r'''$.montant''',
                              ) !=
                              null)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  '${getJsonField(
                                    widget.task,
                                    r'''$.op''',
                                  ).toString()}-${getJsonField(
                                    widget.task,
                                    r'''$.type_pay''',
                                  ).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          getJsonField(
                            widget.task,
                            r'''$.name''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'A: ${dateTimeFormat('d/M/y', functions.jsonToDate(getJsonField(
                                widget.task,
                                r'''$.date_pay''',
                              )))}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      if (getJsonField(
                            widget.task,
                            r'''$.disc''',
                          ) !=
                          null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: AutoSizeText(
                            getJsonField(
                              widget.task,
                              r'''$.disc''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      if (getJsonField(
                            widget.task,
                            r'''$.reply_super''',
                          ) !=
                          null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: AutoSizeText(
                            getJsonField(
                              widget.task,
                              r'''$.reply_super''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (getJsonField(
                          widget.task,
                          r'''$.montant''',
                        ) !=
                        null)
                      Text(
                        formatNumber(
                          functions.toDouble(
                              getJsonField(
                                widget.task,
                                r'''$.montant''',
                              ).toString(),
                              false),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: 'DA ',
                        ),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        dateTimeFormat(
                            'relative',
                            functions.stringToDate(getJsonField(
                              widget.task,
                              r'''$.created_at''',
                            ).toString())),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).grayIcon,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        getJsonField(
                          widget.task,
                          r'''$.updatedby''',
                        ).toString(),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).grayIcon,
                              fontSize: 12.0,
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
    );
  }
}
