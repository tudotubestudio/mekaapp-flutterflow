import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'get_gift_task_model.dart';
export 'get_gift_task_model.dart';

class GetGiftTaskWidget extends StatefulWidget {
  const GetGiftTaskWidget({
    Key? key,
    this.task,
    this.order,
  }) : super(key: key);

  final dynamic task;
  final dynamic order;

  @override
  _GetGiftTaskWidgetState createState() => _GetGiftTaskWidgetState();
}

class _GetGiftTaskWidgetState extends State<GetGiftTaskWidget> {
  late GetGiftTaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetGiftTaskModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'GetGiftTask'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('GET_GIFT_TASK_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Gifts',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (functions.jsonToDouble(getJsonField(
                          widget.task,
                          r'''$.gift_money1''',
                        )) >
                        0.0)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 4.0, 8.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Money',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      formatNumber(
                                        functions.jsonToDouble(getJsonField(
                                          widget.task,
                                          r'''$.gift_money1''',
                                        )),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: 'DA ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Get Money',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                          widget.task,
                          r'''$.perc_gift_money1''',
                        )) >
                        0.0)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 4.0, 8.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Money (${formatNumber(
                                      functions.jsonToDouble(getJsonField(
                                        widget.task,
                                        r'''$.perc_gift_money1''',
                                      )),
                                      formatType: FormatType.percent,
                                    )})',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      '3 upcoming due dates',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Get Money',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                          widget.task,
                          r'''$.gift_chiffre1''',
                        )) >
                        0.0)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 4.0, 8.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chiffre Quota',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        widget.task,
                                        r'''$.gift_chiffre1''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (getJsonField(
                                widget.order,
                                r'''$.target_id_chiffre''',
                              ) ==
                              null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'GET_GIFT_TASK_GET_CHIFFRE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');
                                  _model.rGetChiffreQuota =
                                      await TaskGetChiffreQuotaCall.call(
                                    taskId: getJsonField(
                                      widget.task,
                                      r'''$.id''',
                                    ),
                                    perc: false,
                                    orderId: getJsonField(
                                      widget.order,
                                      r'''$.c_order_id''',
                                    ).toString(),
                                    token: valueOrDefault(
                                        currentUserDocument?.token, ''),
                                  );
                                  if ((_model.rGetChiffreQuota?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.rGetChiffreQuota
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.seccess''',
                                          ).toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.rGetChiffreQuota
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.error''',
                                          ).toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor3,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'Get Chiffre',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                          if (getJsonField(
                                widget.order,
                                r'''$.target_id_chiffre''',
                              ) !=
                              null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Icon(
                                Icons.check,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    if (functions.jsonToDouble(getJsonField(
                          widget.task,
                          r'''$.perc_gift_chiffre1''',
                        )) >
                        0.0)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 4.0, 8.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chiffre Quota (${formatNumber(
                                      functions.jsonToDouble(getJsonField(
                                        widget.task,
                                        r'''$.perc_gift_chiffre1''',
                                      )),
                                      formatType: FormatType.percent,
                                    )})',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      functions
                                          .multiplicationTwoNum(
                                              functions
                                                  .jsonToDouble(getJsonField(
                                                widget.task,
                                                r'''$.obj1''',
                                              )),
                                              functions
                                                  .jsonToDouble(getJsonField(
                                                widget.task,
                                                r'''$.perc_gift_chiffre1''',
                                              )))
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (getJsonField(
                                widget.order,
                                r'''$.target_id_chiffre''',
                              ) ==
                              null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'GET_GIFT_TASK_GET_CHIFFRE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');
                                  _model.rGetChiffreQuotaPerc =
                                      await TaskGetChiffreQuotaCall.call(
                                    taskId: getJsonField(
                                      widget.task,
                                      r'''$.id''',
                                    ),
                                    perc: true,
                                    token: valueOrDefault(
                                        currentUserDocument?.token, ''),
                                    orderId: getJsonField(
                                      widget.order,
                                      r'''$.c_order_id''',
                                    ).toString(),
                                  );
                                  if ((_model.rGetChiffreQuotaPerc?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.rGetChiffreQuotaPerc
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.seccess''',
                                          ).toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.rGetChiffreQuotaPerc
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.error''',
                                          ).toString(),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor3,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'Get Chiffre',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                          if (getJsonField(
                                widget.order,
                                r'''$.target_id_chiffre''',
                              ) !=
                              null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Icon(
                                Icons.check,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    if (functions.jsonToDouble(getJsonField(
                          widget.task,
                          r'''$.gift_prods1''',
                        )) >
                        0.0)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 4.0, 8.0),
                            child: Container(
                              width: 4.0,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Products Quota',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final prodsGifts1 = getJsonField(
                                        widget.task,
                                        r'''$.list_gift_prods1''',
                                      ).toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: prodsGifts1.length,
                                        itemBuilder:
                                            (context, prodsGifts1Index) {
                                          final prodsGifts1Item =
                                              prodsGifts1[prodsGifts1Index];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: Color(0x3416202A),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            prodsGifts1Item,
                                                            r'''$.quantity''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall,
                                                        ),
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
                                                        child: AutoSizeText(
                                                          getJsonField(
                                                            prodsGifts1Item,
                                                            r'''$.product.name''',
                                                          ).toString(),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
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
                                  if (getJsonField(
                                        widget.order,
                                        r'''$.target_id_prod''',
                                      ) ==
                                      null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'GET_GIFT_TASK_GET_PRODUCTS_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.rGetProdsQuota =
                                              await TaskGetProdsQuotaCall.call(
                                            packId: getJsonField(
                                              widget.task,
                                              r'''$.id''',
                                            ).toString(),
                                            orderId: getJsonField(
                                              widget.order,
                                              r'''$.c_order_id''',
                                            ).toString(),
                                            token: valueOrDefault(
                                                currentUserDocument?.token, ''),
                                          );
                                          if ((_model
                                                  .rGetProdsQuota?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.rGetProdsQuota
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.seccess''',
                                                  ).toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.rGetProdsQuota
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.error''',
                                                  ).toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: 'Get Products',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.order,
                                        r'''$.target_id_prod''',
                                      ) !=
                                      null)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Icon(
                                            Icons.check,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                if (functions.jsonToDouble(getJsonField(
                      widget.task,
                      r'''$.gift_prods1''',
                    )) >
                    0.0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x25000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
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
