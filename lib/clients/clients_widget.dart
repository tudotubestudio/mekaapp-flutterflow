import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/client_task_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'clients_model.dart';
export 'clients_model.dart';

class ClientsWidget extends StatefulWidget {
  const ClientsWidget({Key? key}) : super(key: key);

  @override
  _ClientsWidgetState createState() => _ClientsWidgetState();
}

class _ClientsWidgetState extends State<ClientsWidget> {
  late ClientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Clients'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
              logFirebaseEvent('CLIENTS_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Text(
            'Clients',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData('A', Icons.train_outlined),
                        ChipData('B'),
                        ChipData('C'),
                        ChipData('Stop'),
                        ChipData('Watch'),
                        ChipData('not work three months')
                      ],
                      onChanged: (val) =>
                          setState(() => _model.choiceChipsValue = val?.first),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: Color(0xFFE3E7ED),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        iconColor: Colors.white,
                        iconSize: 18.0,
                        elevation: 4.0,
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFE3E7ED),
                                ),
                        iconColor: Color(0xFFE3E7ED),
                        iconSize: 18.0,
                        elevation: 4.0,
                      ),
                      chipSpacing: 20.0,
                      multiselect: false,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: AuthUserStreamWidget(
                builder: (context) => FutureBuilder<ApiCallResponse>(
                  future: (_model
                          .apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(ClientsGroup.listClientsByOpCall.call(
                          token: valueOrDefault(currentUserDocument?.token, ''),
                        )))
                      .future,
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
                    final tabBarListClientsByOpResponse = snapshot.data!;
                    return DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).gray600,
                            labelStyle:
                                FlutterFlowTheme.of(context).titleMedium,
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            indicatorWeight: 3.0,
                            tabs: [
                              Tab(
                                text: 'All',
                              ),
                              Tab(
                                text: 'Stop',
                              ),
                              Tab(
                                text: 'Watch',
                              ),
                              Tab(
                                text: 'Rate',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final client =
                                          ClientsGroup.listClientsByOpCall
                                                  .data(
                                                    tabBarListClientsByOpResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      if (client.isEmpty) {
                                        return Image.asset(
                                          'assets/images/7486744.png',
                                        );
                                      }
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'CLIENTS_ListView_d44wrs5q_ON_PULL_TO_REF');
                                          logFirebaseEvent(
                                              'ListView_refresh_database_request');
                                          setState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: client.length,
                                          itemBuilder: (context, clientIndex) {
                                            final clientItem =
                                                client[clientIndex];
                                            return ClientTaskWidget(
                                              key: Key(
                                                  'Key12d_${clientIndex}_of_${client.length}'),
                                              client: clientItem,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final client =
                                          ClientsGroup.listClientsByOpCall
                                                  .clientsStop(
                                                    tabBarListClientsByOpResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'CLIENTS_ListView_0nexhi7l_ON_PULL_TO_REF');
                                          logFirebaseEvent(
                                              'ListView_refresh_database_request');
                                          setState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: client.length,
                                          itemBuilder: (context, clientIndex) {
                                            final clientItem =
                                                client[clientIndex];
                                            return ClientTaskWidget(
                                              key: Key(
                                                  'Keyr2x_${clientIndex}_of_${client.length}'),
                                              client: clientItem,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final client =
                                          ClientsGroup.listClientsByOpCall
                                                  .clientsWatch(
                                                    tabBarListClientsByOpResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'CLIENTS_ListView_j6yzlgyz_ON_PULL_TO_REF');
                                          logFirebaseEvent(
                                              'ListView_refresh_database_request');
                                          setState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: client.length,
                                          itemBuilder: (context, clientIndex) {
                                            final clientItem =
                                                client[clientIndex];
                                            return ClientTaskWidget(
                                              key: Key(
                                                  'Keyesv_${clientIndex}_of_${client.length}'),
                                              client: clientItem,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 500.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final client =
                                              ClientsGroup.listClientsByOpCall
                                                      .rateAPlus(
                                                        tabBarListClientsByOpResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];
                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'CLIENTS_ListView_p5g10th1_ON_PULL_TO_REF');
                                              logFirebaseEvent(
                                                  'ListView_refresh_database_request');
                                              setState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted();
                                            },
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount: client.length,
                                              itemBuilder:
                                                  (context, clientIndex) {
                                                final clientItem =
                                                    client[clientIndex];
                                                return ClientTaskWidget(
                                                  key: Key(
                                                      'Keyron_${clientIndex}_of_${client.length}'),
                                                  client: clientItem,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
