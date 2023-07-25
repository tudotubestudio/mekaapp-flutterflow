import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_order_mission_model.dart';
export 'create_order_mission_model.dart';

class CreateOrderMissionWidget extends StatefulWidget {
  const CreateOrderMissionWidget({
    Key? key,
    this.region,
    this.listLivreurs,
    this.listVecules,
  }) : super(key: key);

  final dynamic region;
  final dynamic listLivreurs;
  final dynamic listVecules;

  @override
  _CreateOrderMissionWidgetState createState() =>
      _CreateOrderMissionWidgetState();
}

class _CreateOrderMissionWidgetState extends State<CreateOrderMissionWidget> {
  late CreateOrderMissionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrderMissionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_ORDER_MISSION_CreateOrderMission_');
      logFirebaseEvent('CreateOrderMission_update_widget_state');
      setState(() {
        _model.dateStart = functions.getDateTomorrow();
        _model.dateEnd = functions.getDateTomorrow();
      });
    });

    _model.destinationController1 ??= TextEditingController(
        text: 'Region: ${getJsonField(
      widget.region,
      r'''$.region''',
    ).toString().toString()}');
    _model.destinationController2 ??= TextEditingController(
        text: 'BATNA - ${getJsonField(
      widget.region,
      r'''$.region''',
    ).toString().toString()}-  BATNA');
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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.refresh,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('CREATE_ORDER_MISSION_refresh_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_reset_form_fields');
                    setState(() {
                      _model.withLivreurValueController?.reset();
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.destinationController1,
                          autofocus: true,
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Region',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                          validator: _model.destinationController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.livreurValueController ??=
                        FormFieldController<String>(
                      _model.livreurValue ??= getJsonField(
                        widget.region,
                        r'''$.name''',
                      ).toString(),
                    ),
                    options: (getJsonField(
                      widget.listLivreurs,
                      r'''$..name''',
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList()!,
                    onChanged: (val) =>
                        setState(() => _model.livreurValue = val),
                    width: double.infinity,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Livreur...',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.veculeValueController ??=
                        FormFieldController<String>(
                      _model.veculeValue ??= getJsonField(
                        widget.region,
                        r'''$.truck''',
                      ).toString(),
                    ),
                    options: (getJsonField(
                      widget.listVecules,
                      r'''$..name''',
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList()!,
                    onChanged: (val) =>
                        setState(() => _model.veculeValue = val),
                    width: double.infinity,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Moyen de locomotion...',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'From:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CREATE_ORDER_MISSION_Container_jy8d5e8a_');
                              logFirebaseEvent('Container_date_time_picker');
                              final _datePicked1Date = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                              );

                              if (_datePicked1Date != null) {
                                setState(() {
                                  _model.datePicked1 = DateTime(
                                    _datePicked1Date.year,
                                    _datePicked1Date.month,
                                    _datePicked1Date.day,
                                  );
                                });
                              }
                              logFirebaseEvent('Container_update_widget_state');
                              setState(() {
                                _model.dateStart = _model.datePicked1;
                              });
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dateTimeFormat('d/M/y', _model.dateStart),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.date_range,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'To:',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CREATE_ORDER_MISSION_Container_kvya6gty_');
                              logFirebaseEvent('Container_date_time_picker');
                              final _datePicked2Date = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                              );

                              if (_datePicked2Date != null) {
                                setState(() {
                                  _model.datePicked2 = DateTime(
                                    _datePicked2Date.year,
                                    _datePicked2Date.month,
                                    _datePicked2Date.day,
                                  );
                                });
                              }
                              logFirebaseEvent('Container_update_widget_state');
                              setState(() {
                                _model.dateEnd = _model.datePicked2;
                              });
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dateTimeFormat('d/M/y', _model.dateEnd),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.date_range,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.destinationController2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.destinationController2',
                            Duration(milliseconds: 1000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Destination',
                            hintText: 'Destination ...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                          validator: _model.destinationController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.withLivreurValueController ??=
                        FormFieldController<String>(null),
                    options: (getJsonField(
                      widget.listLivreurs,
                      r'''$..name''',
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList()!,
                    onChanged: (val) =>
                        setState(() => _model.withLivreurValue = val),
                    width: double.infinity,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Accompagnateur...',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FutureBuilder<ApiCallResponse>(
                            future: OrderMissionGroup
                                .clientsHoreEchoOrdreMissionCall
                                .call(
                              token: valueOrDefault(
                                  currentUserDocument?.token, ''),
                              cSalesregionId: functions.jsonToInt(getJsonField(
                                widget.region,
                                r'''$.c_salesregion_id''',
                              )),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final buttonClientsHoreEchoOrdreMissionResponse =
                                  snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CREATE_ORDER_MISSION_GENERATE_ORDRE_BTN_');
                                  logFirebaseEvent('Button_backend_call');
                                  _model.resOrdreMission =
                                      await OrderMissionGroup
                                          .addOrdreMissionCall
                                          .call(
                                    cBpartnerId: functions.getIdFromListJson(
                                        widget.listLivreurs!,
                                        _model.livreurValue!,
                                        'id'),
                                    cSalesregionId:
                                        functions.jsonToInt(getJsonField(
                                      widget.region,
                                      r'''$.c_salesregion_id''',
                                    )),
                                    destination:
                                        _model.destinationController2.text,
                                    dateStart: _model.dateStart?.toString(),
                                    dateEnd: _model.dateEnd?.toString(),
                                    barecode: random_data.randomString(
                                      20,
                                      20,
                                      true,
                                      true,
                                      true,
                                    ),
                                    token: valueOrDefault(
                                        currentUserDocument?.token, ''),
                                    ddVehicleId: functions.getIdFromListJson(
                                        widget.listVecules!,
                                        _model.veculeValue!,
                                        'dd_vehicle_id'),
                                    withCBpartnerId:
                                        _model.withLivreurValue != null &&
                                                _model.withLivreurValue != ''
                                            ? functions.getIdFromListJson(
                                                widget.listLivreurs!,
                                                _model.withLivreurValue!,
                                                'id')
                                            : null,
                                  );
                                  if ((_model.resOrdreMission?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Added seccess',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    );
                                    logFirebaseEvent('Button_custom_action');
                                    await actions
                                        .pdfOrdreMissionDownloadMultiPages(
                                      context,
                                      getJsonField(
                                        (_model.resOrdreMission?.jsonBody ??
                                            ''),
                                        r'''$.id''',
                                      ).toString(),
                                      _model.livreurValue!,
                                      _model.destinationController2.text,
                                      _model.veculeValue!,
                                      dateTimeFormat('d/M/y', _model.dateStart),
                                      dateTimeFormat('d/M/y', _model.dateEnd),
                                      valueOrDefault<String>(
                                        _model.withLivreurValue,
                                        '........./..........',
                                      ),
                                      dateTimeFormat(
                                          'd/M/y',
                                          functions.jsonToDate(getJsonField(
                                            (_model.resOrdreMission?.jsonBody ??
                                                ''),
                                            r'''$.created_at''',
                                          ))),
                                      currentUserDisplayName,
                                      getJsonField(
                                        (_model.resOrdreMission?.jsonBody ??
                                            ''),
                                        r'''$.barecode''',
                                      ).toString(),
                                      false,
                                      OrderMissionGroup
                                          .clientsHoreEchoOrdreMissionCall
                                          .data(
                                            buttonClientsHoreEchoOrdreMissionResponse
                                                .jsonBody,
                                          )!
                                          .toList(),
                                    );
                                    logFirebaseEvent(
                                        'Button_reset_form_fields');
                                    setState(() {
                                      _model.destinationController2?.text =
                                          'BATNA - ${getJsonField(
                                        widget.region,
                                        r'''$.region''',
                                      ).toString()}-  BATNA';
                                    });
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error added',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'Generate Ordre',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF39D2C0),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              );
                            },
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
      ),
    );
  }
}
