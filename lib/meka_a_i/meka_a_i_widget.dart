import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/table_chiffre_ops_day_widget.dart';
import '/components/table_my_quotas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meka_a_i_model.dart';
export 'meka_a_i_model.dart';

class MekaAIWidget extends StatefulWidget {
  const MekaAIWidget({
    Key? key,
    required this.chat,
    required this.user,
  }) : super(key: key);

  final dynamic chat;
  final UsersRecord? user;

  @override
  _MekaAIWidgetState createState() => _MekaAIWidgetState();
}

class _MekaAIWidgetState extends State<MekaAIWidget> {
  late MekaAIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MekaAIModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MekaAI'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MEKA_A_I_PAGE_MekaAI_ON_INIT_STATE');
      logFirebaseEvent('MekaAI_backend_call');
      _model.apiResultisr = await MekaAiGroup.chatMessagesCall.call(
        chat: getJsonField(
          widget.chat,
          r'''$.id''',
        ),
        token: valueOrDefault(currentUserDocument?.token, ''),
        pageSize: 20,
        page: 0,
      );
      if ((_model.apiResultisr?.succeeded ?? true)) {
        logFirebaseEvent('MekaAI_update_widget_state');
        setState(() {
          _model.messagesChat = getJsonField(
            (_model.apiResultisr?.jsonBody ?? ''),
            r'''$.data''',
          )!
              .toList()
              .cast<dynamic>();
        });
        logFirebaseEvent('MekaAI_update_widget_state');
        setState(() {
          _model.lastId = getJsonField(
            (_model.apiResultisr?.jsonBody ?? ''),
            r'''$.data[0].id''',
          );
        });
        logFirebaseEvent('MekaAI_start_periodic_action');
        _model.instantTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 2000),
          callback: (timer) async {
            logFirebaseEvent('MekaAI_backend_call');
            _model.apiResultmh5 = await MekaAiGroup.chatMessagesSyncCall.call(
              chat: getJsonField(
                widget.chat,
                r'''$.id''',
              ),
              token: valueOrDefault(currentUserDocument?.token, ''),
              lastId: _model.lastId,
            );
            if ((_model.apiResultmh5?.succeeded ?? true)) {
              logFirebaseEvent('MekaAI_update_widget_state');
              setState(() {
                _model.lastId = getJsonField(
                  (_model.apiResultmh5?.jsonBody ?? ''),
                  r'''$[0].id''',
                );
              });
              logFirebaseEvent('MekaAI_update_widget_state');
              setState(() {
                _model.messagesChat = functions
                    .addListJsonData(_model.messagesChat.toList(),
                        (_model.apiResultmh5?.jsonBody ?? ''))!
                    .toList()
                    .cast<dynamic>();
              });
            }
          },
          startImmediately: true,
        );
      }
    });

    _model.textChatController ??= TextEditingController();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
              logFirebaseEvent('MEKA_A_I_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            widget.user!.displayName,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).gray200,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final msg = _model.messagesChat.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: msg.length,
                          itemBuilder: (context, msgIndex) {
                            final msgItem = msg[msgIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (getJsonField(
                                          msgItem,
                                          r'''$.user''',
                                        ) !=
                                        valueOrDefault(
                                            currentUserDocument?.adUserId, 0))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    widget.user!.photoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: Text(
                                                      getJsonField(
                                                        msgItem,
                                                        r'''$.text''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (getJsonField(
                                          msgItem,
                                          r'''$.user''',
                                        ) ==
                                        valueOrDefault(
                                            currentUserDocument?.adUserId, 0))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (getJsonField(
                                                    msgItem,
                                                    r'''$.id''',
                                                  ) !=
                                                  '0')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: Text(
                                                        getJsonField(
                                                          msgItem,
                                                          r'''$.text''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Container(
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
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                if (getJsonField(
                                      msgItem,
                                      r'''$.type''',
                                    ) ==
                                    '2')
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Wrap(
                                        spacing: 20.0,
                                        runSpacing: 20.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MEKA_A_I_PAGE_CHIFFRE_OPS_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await MekaAiGroup.addMessageCall
                                                  .call(
                                                token: valueOrDefault(
                                                    currentUserDocument?.token,
                                                    ''),
                                                chat: getJsonField(
                                                  widget.chat,
                                                  r'''$.id''',
                                                ),
                                                type: 3,
                                                text: 'chiffre_ops',
                                              );
                                            },
                                            text: 'Chiffre Ops',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray200,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MEKA_A_I_PAGE_MY_QUOTAS_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await MekaAiGroup.addMessageCall
                                                  .call(
                                                token: valueOrDefault(
                                                    currentUserDocument?.token,
                                                    ''),
                                                chat: getJsonField(
                                                  widget.chat,
                                                  r'''$.id''',
                                                ),
                                                type: 3,
                                                text: 'my_quotas',
                                              );
                                            },
                                            text: 'My Quotas',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray200,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (getJsonField(
                                      msgItem,
                                      r'''$.type''',
                                    ) ==
                                    '3')
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (getJsonField(
                                            msgItem,
                                            r'''$.text''',
                                          ) ==
                                          'chiffre_ops')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: TableChiffreOpsDayWidget(
                                            key: Key(
                                                'Keyur9_${msgIndex}_of_${msg.length}'),
                                            data: getJsonField(
                                              msgItem,
                                              r'''$.data''',
                                            ),
                                          ),
                                        ),
                                      if (getJsonField(
                                            msgItem,
                                            r'''$.text''',
                                          ) ==
                                          'my_quotas')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: TableMyQuotasWidget(
                                            key: Key(
                                                'Keycx7_${msgIndex}_of_${msg.length}'),
                                            data: getJsonField(
                                              msgItem,
                                              r'''$.data''',
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F2F5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.emoji_emotions_rounded,
                        color: FlutterFlowTheme.of(context).grayIcon,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.attachment_rounded,
                        color: FlutterFlowTheme.of(context).grayIcon,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                        child: TextFormField(
                          controller: _model.textChatController,
                          onFieldSubmitted: (_) async {
                            logFirebaseEvent(
                                'MEKA_A_I_TextChat_ON_TEXTFIELD_SUBMIT');
                            logFirebaseEvent('TextChat_update_widget_state');
                            setState(() {
                              _model.msgWait = _model.textChatController.text;
                            });
                            logFirebaseEvent('TextChat_backend_call');
                            _model.addMessageRes =
                                await MekaAiGroup.addMessageCall.call(
                              token: valueOrDefault(
                                  currentUserDocument?.token, ''),
                              chat: getJsonField(
                                widget.chat,
                                r'''$.id''',
                              ),
                              text: _model.textChatController.text,
                              type: 1,
                            );
                            logFirebaseEvent('TextChat_clear_text_fields');
                            setState(() {
                              _model.textChatController?.clear();
                            });
                            if ((_model.addMessageRes?.succeeded ?? true)) {
                              logFirebaseEvent('TextChat_update_widget_state');
                              setState(() {
                                _model.msgWait = '';
                              });
                            }

                            setState(() {});
                          },
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.textChatControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 0.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.fiber_smart_record,
                        color: FlutterFlowTheme.of(context).grayIcon,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'MEKA_A_I_fiber_smart_record_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_backend_call');
                        await MekaAiGroup.addMessageCall.call(
                          token: valueOrDefault(currentUserDocument?.token, ''),
                          chat: getJsonField(
                            widget.chat,
                            r'''$.id''',
                          ),
                          type: 2,
                        );
                      },
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
