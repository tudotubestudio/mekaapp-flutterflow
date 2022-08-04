import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BootWidget extends StatefulWidget {
  const BootWidget({Key? key}) : super(key: key);

  @override
  _BootWidgetState createState() => _BootWidgetState();
}

class _BootWidgetState extends State<BootWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () async {
            await signOut();
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'SignIn'),
              ),
              (r) => false,
            );
          },
          child: Text(
            'Log Out',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<ConversationsRecord>>(
                  stream: queryConversationsRecord(
                    queryBuilder: (conversationsRecord) => conversationsRecord
                        .orderBy('created_at', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ConversationsRecord> listViewConversationsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewConversationsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewConversationsRecord =
                            listViewConversationsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (listViewConversationsRecord.createdBy ==
                                      FFAppState().bot)
                                    StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewConversationsRecord
                                              .createdBy!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final circleImageUsersRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: 70,
                                          height: 70,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              circleImageUsersRecord.photoUrl,
                                              'https://www.shareicon.net/data/2016/05/24/770128_man_512x512.png',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (listViewConversationsRecord
                                                  .type ==
                                              'perc_ops')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        'Perc operatrices',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          4,
                                                                          4,
                                                                          4),
                                                              child: Text(
                                                                'Name',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          4,
                                                                          4,
                                                                          4),
                                                              child: Text(
                                                                'Total perc',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: PercOpCall.call(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final listViewPercOpResponse =
                                                            snapshot.data!;
                                                        return Builder(
                                                          builder: (context) {
                                                            final perc =
                                                                getJsonField(
                                                              listViewPercOpResponse
                                                                  .jsonBody,
                                                              r'''$''',
                                                            ).toList();
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  perc.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      percIndex) {
                                                                final percItem =
                                                                    perc[
                                                                        percIndex];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          border:
                                                                              Border.all(
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4,
                                                                              4,
                                                                              4,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              percItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          border:
                                                                              Border.all(
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4,
                                                                              4,
                                                                              4,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              percItem,
                                                                              r'''$.total''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (listViewConversationsRecord.createdBy !=
                                      FFAppState().bot)
                                    StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewConversationsRecord
                                              .createdBy!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final circleImageUsersRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: 70,
                                          height: 70,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              circleImageUsersRecord.photoUrl,
                                              'https://www.shareicon.net/data/2016/05/24/770128_man_512x512.png',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: StreamBuilder<List<ActionsRecord>>(
                  stream: queryActionsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ActionsRecord> listViewActionsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listViewActionsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewActionsRecord =
                            listViewActionsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final conversationsCreateData =
                                  createConversationsRecordData(
                                type: listViewActionsRecord.result,
                                createdAt: getCurrentTimestamp,
                                createdBy: FFAppState().bot,
                              );
                              await ConversationsRecord.collection
                                  .doc()
                                  .set(conversationsCreateData);
                            },
                            text: listViewActionsRecord.name!,
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                child: TextFormField(
                  controller: textController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '[Some hint text...]',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF100D0D),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF100D0D),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
