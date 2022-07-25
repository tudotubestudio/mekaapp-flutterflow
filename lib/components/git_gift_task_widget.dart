import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GitGiftTaskWidget extends StatefulWidget {
  const GitGiftTaskWidget({
    Key? key,
    this.task,
  }) : super(key: key);

  final dynamic task;

  @override
  _GitGiftTaskWidgetState createState() => _GitGiftTaskWidgetState();
}

class _GitGiftTaskWidgetState extends State<GitGiftTaskWidget> {
  ApiCallResponse? rGetChiffreQuota;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        if ((functions.jsonToDouble(getJsonField(
              widget.task,
              r'''$.gift_money1''',
            ))) >
            0.0)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x25000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                    child: Container(
                      width: 4,
                      height: 90,
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
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              getJsonField(
                                widget.task!,
                                r'''$.gift_money1''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Get Money',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if ((functions.jsonToDouble(getJsonField(
              widget.task,
              r'''$.gift_chiffre1''',
            ))) >
            0.0)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x25000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                    child: Container(
                      width: 4,
                      height: 90,
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
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              getJsonField(
                                widget.task!,
                                r'''$.gift_chiffre1''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      rGetChiffreQuota = await TaskGetChiffreQuotaCall.call(
                        total: getJsonField(
                          widget.task,
                          r'''$.gift_chiffre1''',
                        ).toString(),
                      );
                      if ((rGetChiffreQuota!?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              getJsonField(
                                (rGetChiffreQuota!?.jsonBody ?? ''),
                                r'''$.seccess''',
                              ).toString(),
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              getJsonField(
                                (rGetChiffreQuota!?.jsonBody ?? ''),
                                r'''$.error''',
                              ).toString(),
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).customColor3,
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text: 'Get Chiffre',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if ((functions.jsonToDouble(getJsonField(
              widget.task,
              r'''$.gift_prods1''',
            ))) >
            0.0)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x25000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                    child: Container(
                      width: 4,
                      height: 90,
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
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '4 Folders',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '3 upcoming due dates',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Get Products',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
