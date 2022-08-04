import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectCountReservedWidget extends StatefulWidget {
  const SelectCountReservedWidget({
    Key? key,
    this.task,
  }) : super(key: key);

  final dynamic task;

  @override
  _SelectCountReservedWidgetState createState() =>
      _SelectCountReservedWidgetState();
}

class _SelectCountReservedWidgetState extends State<SelectCountReservedWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? resReserve;
  TextEditingController? maxReserveController;
  final formKey = GlobalKey<FormState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
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

    maxReserveController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    controller: maxReserveController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '[Some hint text...]',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).title1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      'max reserve ${getJsonField(
                        widget.task,
                        r'''$.maxReserve''',
                      ).toString()}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).customColor3,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      resReserve = await TaskReservedPackCall.call(
                        taskId: getJsonField(
                          widget.task,
                          r'''$.id''',
                        ).toString(),
                        countReserve: int.parse(maxReserveController!.text),
                      );
                      if ((resReserve?.succeeded ?? true)) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Seccess reserved',
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
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              getJsonField(
                                (resReserve?.jsonBody ?? ''),
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
                    text: 'Reserve',
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
          ],
        ),
      ),
    ).animated([animationsMap['containerOnPageLoadAnimation']!]);
  }
}
