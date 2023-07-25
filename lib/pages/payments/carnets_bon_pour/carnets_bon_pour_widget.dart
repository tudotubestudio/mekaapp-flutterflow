import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'carnets_bon_pour_model.dart';
export 'carnets_bon_pour_model.dart';

class CarnetsBonPourWidget extends StatefulWidget {
  const CarnetsBonPourWidget({Key? key}) : super(key: key);

  @override
  _CarnetsBonPourWidgetState createState() => _CarnetsBonPourWidgetState();
}

class _CarnetsBonPourWidgetState extends State<CarnetsBonPourWidget> {
  late CarnetsBonPourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarnetsBonPourModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CarnetsBonPour'});
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Carnet Bon Pour',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.qr_code_scanner,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('CARNETS_BON_POUR_qr_code_scanner_ICN_ON_');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('ScanBonPour');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: AuthUserStreamWidget(
          builder: (context) => PagedListView<ApiPagingParams, dynamic>(
            pagingController: _model.setListViewController(
              (nextPageMarker) => PaymentsGroup.paymentBooksCall.call(
                token: valueOrDefault(currentUserDocument?.token, ''),
                pageSize: 10,
                page: nextPageMarker.nextPageNumber,
              ),
            ),
            padding: EdgeInsets.zero,
            reverse: false,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
              // Customize what your widget looks like when it's loading another page.
              newPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),

              itemBuilder: (context, _, carnetIndex) {
                final carnetItem =
                    _model.listViewPagingController!.itemList![carnetIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.0,
                          color: FlutterFlowTheme.of(context).lineColor,
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 4.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getJsonField(
                                      carnetItem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: getJsonField(
                                            carnetItem,
                                            r'''$.sernofrom''',
                                          ).toString(),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: '-',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: getJsonField(
                                            carnetItem,
                                            r'''$.sernoto''',
                                          ).toString(),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                  'd/M/y',
                                  functions.jsonToDate(getJsonField(
                                    carnetItem,
                                    r'''$.created''',
                                  ))),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.print_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CARNETS_BON_POUR_print_outlined_ICN_ON_T');
                              logFirebaseEvent('IconButton_custom_action');
                              await actions.pdfQrCarnet(
                                context,
                                FFAppState().NameCompany,
                                getJsonField(
                                  carnetItem,
                                  r'''$.name''',
                                ).toString(),
                                getJsonField(
                                  carnetItem,
                                  r'''$.xx_paymentbook_id''',
                                ).toString(),
                                getJsonField(
                                  carnetItem,
                                  r'''$.sernofrom''',
                                ).toString(),
                                getJsonField(
                                  carnetItem,
                                  r'''$.sernoto''',
                                ).toString(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
