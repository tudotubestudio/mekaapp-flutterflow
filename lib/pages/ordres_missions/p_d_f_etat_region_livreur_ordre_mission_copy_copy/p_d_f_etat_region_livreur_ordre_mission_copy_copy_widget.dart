import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_etat_region_livreur_ordre_mission_copy_copy_model.dart';
export 'p_d_f_etat_region_livreur_ordre_mission_copy_copy_model.dart';

class PDFEtatRegionLivreurOrdreMissionCopyCopyWidget extends StatefulWidget {
  const PDFEtatRegionLivreurOrdreMissionCopyCopyWidget({
    Key? key,
    this.region,
  }) : super(key: key);

  final dynamic region;

  @override
  _PDFEtatRegionLivreurOrdreMissionCopyCopyWidgetState createState() =>
      _PDFEtatRegionLivreurOrdreMissionCopyCopyWidgetState();
}

class _PDFEtatRegionLivreurOrdreMissionCopyCopyWidgetState
    extends State<PDFEtatRegionLivreurOrdreMissionCopyCopyWidget> {
  late PDFEtatRegionLivreurOrdreMissionCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => PDFEtatRegionLivreurOrdreMissionCopyCopyModel());

    logFirebaseEvent('screen_view', parameters: {
      'screen_name': 'PDFEtatRegionLivreurOrdreMissionCopyCopy'
    });
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
        body: SafeArea(
          child: AuthUserStreamWidget(
            builder: (context) => FutureBuilder<ApiCallResponse>(
              future: OrderMissionGroup.clientsHoreEchoOrdreMissionCall.call(
                token: valueOrDefault(currentUserDocument?.token, ''),
                cSalesregionId: getJsonField(
                  widget.region,
                  r'''$.c_salesregion_id''',
                ),
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
                final containerClientsHoreEchoOrdreMissionResponse =
                    snapshot.data!;
                return Container(
                  width: 554.0,
                  height: 801.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                      Container(
                        width: 554.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).lineColor,
                          border: Border.all(
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Client',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              'H.E',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              'BareCode',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              'Accusé client',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final client = OrderMissionGroup
                                      .clientsHoreEchoOrdreMissionCall
                                      .data(
                                        containerClientsHoreEchoOrdreMissionResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: client.length,
                                itemBuilder: (context, clientIndex) {
                                  final clientItem = client[clientIndex];
                                  return Container(
                                    width: 554.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              getJsonField(
                                                clientItem,
                                                r'''$.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                functions
                                                    .jsonToDouble(getJsonField(
                                                  clientItem,
                                                  r'''$.tot_echue_non_couvert''',
                                                )),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: 'DA ',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ),
                                            BarcodeWidget(
                                              data: '855682828556',
                                              barcode: Barcode.code128(),
                                              width: 80.0,
                                              height: 50.0,
                                              color: Colors.black,
                                              backgroundColor:
                                                  Colors.transparent,
                                              errorBuilder:
                                                  (_context, _error) =>
                                                      SizedBox(
                                                width: 80.0,
                                                height: 50.0,
                                              ),
                                              drawText: true,
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
