import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'validate_debloque_model.dart';
export 'validate_debloque_model.dart';

class ValidateDebloqueWidget extends StatefulWidget {
  const ValidateDebloqueWidget({
    Key? key,
    this.task,
  }) : super(key: key);

  final dynamic task;

  @override
  _ValidateDebloqueWidgetState createState() => _ValidateDebloqueWidgetState();
}

class _ValidateDebloqueWidgetState extends State<ValidateDebloqueWidget> {
  late ValidateDebloqueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValidateDebloqueModel());

    _model.soCreditlimitController ??= TextEditingController();
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

    return Material(
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
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).lineColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Deb/Aug ${getJsonField(
                      widget.task,
                      r'''$.name''',
                    ).toString()}',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Text(
                  getJsonField(
                    widget.task,
                    r'''$.socreditstatus''',
                  ).toString(),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).gray600,
                        fontSize: 32.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Text(
                  'Credit used: ${formatNumber(
                    functions.toDouble(
                        getJsonField(
                          widget.task,
                          r'''$.so_creditused''',
                        ).toString(),
                        false),
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.automatic,
                    currency: 'DA ',
                  )}',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).gray600,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Text(
                  'Credit limit: ${formatNumber(
                    functions.toDouble(
                        getJsonField(
                          widget.task,
                          r'''$.so_creditlimit''',
                        ).toString(),
                        false),
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.automatic,
                    currency: 'DA ',
                  )}',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).gray600,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: AuthUserStreamWidget(
                      builder: (context) => FutureBuilder<ApiCallResponse>(
                        future: ClientsGroup.rapportRouteByMonthsCall.call(
                          cBpartnerId: functions.jsonToInt(getJsonField(
                            widget.task,
                            r'''$.c_bpartner_id''',
                          )),
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
                          final listViewRapportRouteByMonthsResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final month =
                                  ClientsGroup.rapportRouteByMonthsCall
                                          .data(
                                            listViewRapportRouteByMonthsResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: month.length,
                                itemBuilder: (context, monthIndex) {
                                  final monthItem = month[monthIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                          'd/M/y',
                                                          functions.jsonToDate(
                                                              getJsonField(
                                                            monthItem,
                                                            r'''$.dateinvoiced''',
                                                          ))),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                functions.toDouble(
                                                    getJsonField(
                                                      monthItem,
                                                      r'''$.sum''',
                                                    ).toString(),
                                                    false),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: 'DA ',
                                              ),
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (functions
                                  .toDouble(
                                      getJsonField(
                                        widget.task,
                                        r'''$.type''',
                                      ).toString(),
                                      false)
                                  .toString() ==
                              '2')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: TextFormField(
                                  controller: _model.soCreditlimitController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Montant...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: _model
                                      .soCreditlimitControllerValidator
                                      .asValidator(context),
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
                              '1')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VALIDATE_DEBLOQUE_Container_pvmrs6wo_ON_');
                                        logFirebaseEvent(
                                            'Container_date_time_picker');
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: getCurrentTimestamp,
                                          lastDate: DateTime(2050),
                                        );

                                        if (_datePickedDate != null) {
                                          setState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                            );
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat('d/M/y',
                                                      _model.datePicked),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.date_range,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VALIDATE_DEBLOQUE_COMP_SUBMIT_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResultk02 = await ClientsGroup
                                        .updateTaskClientCall
                                        .call(
                                      type: functions.jsonToInt(getJsonField(
                                        widget.task,
                                        r'''$.type''',
                                      )),
                                      cBpartnerId:
                                          functions.jsonToInt(getJsonField(
                                        widget.task,
                                        r'''$.c_bpartner_id''',
                                      )),
                                      xxDate: _model.datePicked?.toString(),
                                      soCreditlimit: double.tryParse(
                                          _model.soCreditlimitController.text),
                                      charkTasksId:
                                          functions.jsonToInt(getJsonField(
                                        widget.task,
                                        r'''$.chark_tasks_id''',
                                      )),
                                      token: valueOrDefault(
                                          currentUserDocument?.token, ''),
                                    );
                                    if ((_model.apiResultk02?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_bottom_sheet');
                                      Navigator.pop(context);
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Submited',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'No Submited',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Submit',
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VALIDATE_DEBLOQUE_COMP_REFUSE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResultk023 = await ClientsGroup
                                        .refuserBlockCall
                                        .call(
                                      taskId: functions.jsonToInt(getJsonField(
                                        widget.task,
                                        r'''$.chark_tasks_id''',
                                      )),
                                      token: valueOrDefault(
                                          currentUserDocument?.token, ''),
                                    );
                                    if ((_model.apiResultk023?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_bottom_sheet');
                                      Navigator.pop(context);
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Submited',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'No Submited',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Refuse',
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .customColor3,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
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
            ),
          ),
        ),
      ),
    );
  }
}
