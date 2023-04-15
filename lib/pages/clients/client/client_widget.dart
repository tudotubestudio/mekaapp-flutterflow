import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/clients/validate_debloque/validate_debloque_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'client_model.dart';
export 'client_model.dart';

class ClientWidget extends StatefulWidget {
  const ClientWidget({
    Key? key,
    this.client,
  }) : super(key: key);

  final dynamic client;

  @override
  _ClientWidgetState createState() => _ClientWidgetState();
}

class _ClientWidgetState extends State<ClientWidget> {
  late ClientModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Client'});
    _model.montantController ??= TextEditingController();
    _model.descController ??= TextEditingController();
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () async {
            logFirebaseEvent('CLIENT_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.safePop();
          },
        ),
        title: Text(
          getJsonField(
            widget.client,
            r'''$.name''',
          ).toString(),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0x32171717),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                formatNumber(
                                  functions.multiplicationTwoNum(
                                      functions.toDouble(
                                          getJsonField(
                                            widget.client,
                                            r'''$.ch_0''',
                                          ).toString(),
                                          false),
                                      10000.0),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'DA ',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'This Month',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xB3FFFFFF),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'credit used: ${formatNumber(
                          functions.toDouble(
                              getJsonField(
                                widget.client,
                                r'''$.so_creditused''',
                              ).toString(),
                              false),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: 'DA ',
                        )}',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'Credit limit: ${formatNumber(
                          functions.toDouble(
                              getJsonField(
                                widget.client,
                                r'''$.so_creditlimit''',
                              ).toString(),
                              false),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: 'DA ',
                        )}',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getJsonField(
                                widget.client,
                                r'''$.rating''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    'Total H.NC',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xB3FFFFFF),
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                                Text(
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
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                        indicatorColor: FlutterFlowTheme.of(context).secondary,
                        tabs: [
                          Tab(
                            text: 'Rec',
                          ),
                          Tab(
                            text: 'Info',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: FlutterFlowTheme.of(context)
                                            .gray200,
                                        child: ExpandableNotifier(
                                          initialExpanded: false,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Demande Deblq/Aug',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            collapsed: Container(),
                                            expanded: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray200,
                                              ),
                                              child: Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Cheque ',
                                                                'Traite',
                                                                'Versement',
                                                                'Virement'
                                                              ],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.dropDownValue =
                                                                          val),
                                                              width: 180.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              hintText:
                                                                  'Type Pay...',
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .gray200,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                              borderWidth: 0.0,
                                                              borderRadius: 2.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .montantController,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Montant...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .montantControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'CLIENT_PAGE_Container_mojjzyum_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Container_date_time_picker');
                                                            final _datePickedDate =
                                                                await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  getCurrentTimestamp,
                                                              firstDate:
                                                                  getCurrentTimestamp,
                                                              lastDate:
                                                                  DateTime(
                                                                      2050),
                                                            );

                                                            if (_datePickedDate !=
                                                                null) {
                                                              setState(() {
                                                                _model.datePicked =
                                                                    DateTime(
                                                                  _datePickedDate
                                                                      .year,
                                                                  _datePickedDate
                                                                      .month,
                                                                  _datePickedDate
                                                                      .day,
                                                                );
                                                              });
                                                            }
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray200,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'd/M/y',
                                                                          _model
                                                                              .datePicked),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .date_range,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .gray600,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .descController,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Desc...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            maxLines: null,
                                                            minLines: 4,
                                                            keyboardType:
                                                                TextInputType
                                                                    .multiline,
                                                            validator: _model
                                                                .descControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CLIENT_PAGE_DEMANDE_DEBLOQUE_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');
                                                                  _model.apiResultDeblq =
                                                                      await ClientsGroup
                                                                          .debloqeClientCall
                                                                          .call(
                                                                    cBpartnerId:
                                                                        getJsonField(
                                                                      widget
                                                                          .client,
                                                                      r'''$.c_bpartner_id''',
                                                                    ).toString(),
                                                                    token: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.token,
                                                                        ''),
                                                                    type: 1,
                                                                    disc: _model
                                                                        .descController
                                                                        .text,
                                                                    datePay: _model
                                                                        .datePicked
                                                                        ?.toString(),
                                                                    montant: double
                                                                        .tryParse(_model
                                                                            .montantController
                                                                            .text),
                                                                    typePay: _model
                                                                        .dropDownValue,
                                                                  );
                                                                  if ((_model
                                                                          .apiResultDeblq
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Order aug solde sended',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Button_refresh_database_request');
                                                                    setState(() => _model
                                                                        .pagingController
                                                                        ?.refresh());
                                                                    await _model
                                                                        .waitForOnePage();
                                                                    logFirebaseEvent(
                                                                        'Button_trigger_push_notification');
                                                                    triggerPushNotification(
                                                                      notificationTitle:
                                                                          'hi2',
                                                                      notificationText:
                                                                          'hi test2',
                                                                      notificationSound:
                                                                          'default',
                                                                      userRefs: [
                                                                        FFAppState()
                                                                            .adminId!
                                                                      ],
                                                                      initialPageName:
                                                                          'Client',
                                                                      parameterData: {
                                                                        'client':
                                                                            widget.client,
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Order Sended Erorr',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).tertiary,
                                                                      ),
                                                                    );
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'Demande debloque',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CLIENT_D_AUGMENTER_LE_SOLDE_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');
                                                                  _model.apiResultAugSold =
                                                                      await ClientsGroup
                                                                          .debloqeClientCall
                                                                          .call(
                                                                    cBpartnerId:
                                                                        getJsonField(
                                                                      widget
                                                                          .client,
                                                                      r'''$.c_bpartner_id''',
                                                                    ).toString(),
                                                                    token: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.token,
                                                                        ''),
                                                                    type: 2,
                                                                    disc: _model
                                                                        .descController
                                                                        .text,
                                                                    datePay: _model
                                                                        .datePicked
                                                                        ?.toString(),
                                                                    montant: double
                                                                        .tryParse(_model
                                                                            .montantController
                                                                            .text),
                                                                    typePay: _model
                                                                        .dropDownValue,
                                                                  );
                                                                  if ((_model
                                                                          .apiResultAugSold
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Order aug solde sended',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Button_refresh_database_request');
                                                                    setState(() => _model
                                                                        .pagingController
                                                                        ?.refresh());
                                                                    await _model
                                                                        .waitForOnePage();
                                                                    logFirebaseEvent(
                                                                        'Button_trigger_push_notification');
                                                                    triggerPushNotification(
                                                                      notificationTitle:
                                                                          'hi2',
                                                                      notificationText:
                                                                          'hi test2',
                                                                      notificationSound:
                                                                          'default',
                                                                      userRefs: [
                                                                        FFAppState()
                                                                            .adminId!
                                                                      ],
                                                                      initialPageName:
                                                                          'Client',
                                                                      parameterData: {
                                                                        'client':
                                                                            widget.client,
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Order Sended Erorr',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).tertiary,
                                                                      ),
                                                                    );
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'D.Augmenter le solde',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
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
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Text(
                                                'Transactions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              RefreshIndicator(
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'CLIENT_ListView_artipoyf_ON_PULL_TO_REFR');
                                              logFirebaseEvent(
                                                  'ListView_refresh_database_request');
                                              setState(() => _model
                                                  .pagingController
                                                  ?.refresh());
                                              await _model.waitForOnePage();
                                            },
                                            child: PagedListView<
                                                ApiPagingParams, dynamic>(
                                              pagingController: () {
                                                if (_model.pagingController !=
                                                    null) {
                                                  return _model
                                                      .pagingController!;
                                                }

                                                _model.pagingController =
                                                    PagingController(
                                                  firstPageKey: ApiPagingParams(
                                                    nextPageNumber: 0,
                                                    numItems: 0,
                                                    lastResponse: null,
                                                  ),
                                                );
                                                _model.pagingController!
                                                    .addPageRequestListener(
                                                        (nextPageMarker) {
                                                  ClientsGroup
                                                      .tasksDebloqeClientsCall
                                                      .call(
                                                    token: valueOrDefault(
                                                        currentUserDocument
                                                            ?.token,
                                                        ''),
                                                    page: nextPageMarker
                                                        .nextPageNumber,
                                                    sizePage: 10,
                                                    cBpartnerId: functions
                                                        .jsonToInt(getJsonField(
                                                      widget.client,
                                                      r'''$.c_bpartner_id''',
                                                    )),
                                                  )
                                                      .then(
                                                          (listViewTasksDebloqeClientsResponse) {
                                                    final pageItems = ClientsGroup
                                                        .tasksDebloqeClientsCall
                                                        .data(
                                                          listViewTasksDebloqeClientsResponse
                                                              .jsonBody,
                                                        )!
                                                        .toList() as List;
                                                    final newNumItems =
                                                        nextPageMarker
                                                                .numItems +
                                                            pageItems.length;
                                                    _model.pagingController!
                                                        .appendPage(
                                                      pageItems,
                                                      (pageItems.length > 0)
                                                          ? ApiPagingParams(
                                                              nextPageNumber:
                                                                  nextPageMarker
                                                                          .nextPageNumber +
                                                                      1,
                                                              numItems:
                                                                  newNumItems,
                                                              lastResponse:
                                                                  listViewTasksDebloqeClientsResponse,
                                                            )
                                                          : null,
                                                    );
                                                  });
                                                });
                                                return _model.pagingController!;
                                              }(),
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              reverse: false,
                                              scrollDirection: Axis.vertical,
                                              builderDelegate:
                                                  PagedChildBuilderDelegate<
                                                      dynamic>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ),

                                                itemBuilder:
                                                    (context, _, taskIndex) {
                                                  final taskItem = _model
                                                      .pagingController!
                                                      .itemList![taskIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CLIENT_PAGE_transaction_ON_TAP');
                                                        if (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.admin,
                                                                false) ==
                                                            true) {
                                                          logFirebaseEvent(
                                                              'transaction_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0x00000000),
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder:
                                                                (bottomSheetContext) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        bottomSheetContext)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.75,
                                                                  child:
                                                                      ValidateDebloqueWidget(
                                                                    task:
                                                                        taskItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          logFirebaseEvent(
                                                              'transaction_refresh_database_request');
                                                          setState(() => _model
                                                              .pagingController
                                                              ?.refresh());
                                                          await _model
                                                              .waitForOnePage();
                                                        }
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.92,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x35000000),
                                                              offset: Offset(
                                                                  0.0, 1.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (functions
                                                                      .toDouble(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          false)
                                                                      .toString() ==
                                                                  '0')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person_search_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (functions
                                                                      .toDouble(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          false)
                                                                      .toString() ==
                                                                  '1')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (functions
                                                                      .toDouble(
                                                                          getJsonField(
                                                                            taskItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          false)
                                                                      .toString() ==
                                                                  '2')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (functions
                                                                                  .toDouble(
                                                                                      getJsonField(
                                                                                        taskItem,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: Text(
                                                                                  'Deb',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (functions
                                                                                  .toDouble(
                                                                                      getJsonField(
                                                                                        taskItem,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: Text(
                                                                                  'Aug',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (getJsonField(
                                                                                taskItem,
                                                                                r'''$.montant''',
                                                                              ) !=
                                                                              null)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                '${getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.type_pay''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      if (getJsonField(
                                                                            taskItem,
                                                                            r'''$.montant''',
                                                                          ) !=
                                                                          null)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            'A: ${dateTimeFormat('d/M/y', functions.jsonToDate(getJsonField(
                                                                                  taskItem,
                                                                                  r'''$.date_pay''',
                                                                                )))}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                            taskItem,
                                                                            r'''$.disc''',
                                                                          ) !=
                                                                          null)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            getJsonField(
                                                                              taskItem,
                                                                              r'''$.disc''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    if (getJsonField(
                                                                          taskItem,
                                                                          r'''$.montant''',
                                                                        ) !=
                                                                        null)
                                                                      Text(
                                                                        formatNumber(
                                                                          functions.toDouble(
                                                                              getJsonField(
                                                                                taskItem,
                                                                                r'''$.montant''',
                                                                              ).toString(),
                                                                              false),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                          currency:
                                                                              'DA ',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                            'relative',
                                                                            functions.stringToDate(getJsonField(
                                                                              taskItem,
                                                                              r'''$.created_at''',
                                                                            ).toString())),
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          taskItem,
                                                                          r'''$.updatedby''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                              fontSize: 12.0,
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
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 400.0,
                                child: FlutterFlowBarChart(
                                  barData: [
                                    FFBarChartData(
                                      yData: functions
                                          .getChiffreJson(widget.client)!,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    )
                                  ],
                                  xLabels: FFAppState().yList,
                                  barWidth: 40.0,
                                  barBorderRadius: BorderRadius.circular(0.0),
                                  groupSpace: 5.0,
                                  chartStylingInfo: ChartStylingInfo(
                                    enableTooltip: true,
                                    tooltipBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .backgroundComponents,
                                    backgroundColor: Colors.white,
                                    showBorder: false,
                                  ),
                                  axisBounds: AxisBounds(),
                                  xAxisLabelInfo: AxisLabelInfo(
                                    title: 'Months',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    showLabels: true,
                                    labelInterval: 10.0,
                                  ),
                                  yAxisLabelInfo: AxisLabelInfo(
                                    showLabels: true,
                                    labelTextStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    labelInterval: 10.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
