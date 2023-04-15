import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_payment_book_lines_rest_model.dart';
export 'list_payment_book_lines_rest_model.dart';

class ListPaymentBookLinesRestWidget extends StatefulWidget {
  const ListPaymentBookLinesRestWidget({
    Key? key,
    this.xxPaymentbookId,
    this.documentNo,
  }) : super(key: key);

  final String? xxPaymentbookId;
  final int? documentNo;

  @override
  _ListPaymentBookLinesRestWidgetState createState() =>
      _ListPaymentBookLinesRestWidgetState();
}

class _ListPaymentBookLinesRestWidgetState
    extends State<ListPaymentBookLinesRestWidget> {
  late ListPaymentBookLinesRestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPaymentBookLinesRestModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListPaymentBookLinesRest'});
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
              logFirebaseEvent('LIST_PAYMENT_BOOK_LINES_REST_arrow_back_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: AuthUserStreamWidget(
          builder: (context) => FutureBuilder<ApiCallResponse>(
            future: PaymentsGroup.paymentBookLinesByIdCall.call(
              token: valueOrDefault(currentUserDocument?.token, ''),
              xxPaymentbookId: widget.xxPaymentbookId,
              documentno: widget.documentNo,
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
              final listViewPaymentBookLinesByIdResponse = snapshot.data!;
              return Builder(
                builder: (context) {
                  final lineBook = getJsonField(
                    listViewPaymentBookLinesByIdResponse.jsonBody,
                    r'''$''',
                  ).toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: lineBook.length,
                    itemBuilder: (context, lineBookIndex) {
                      final lineBookItem = lineBook[lineBookIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
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
                                    child: Text(
                                      getJsonField(
                                        lineBookItem,
                                        r'''$.documentno''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LIST_PAYMENT_BOOK_LINES_REST_chevron_rig');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                      'CreatePaymentBonPour',
                                      queryParams: {
                                        'documentno': serializeParam(
                                          getJsonField(
                                            lineBookItem,
                                            r'''$.documentno''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'xxPaymentBookLineId': serializeParam(
                                          getJsonField(
                                            lineBookItem,
                                            r'''$.xx_paymentbookline_id''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
