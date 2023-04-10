import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_prods_oblg_model.dart';
export 'search_prods_oblg_model.dart';

class SearchProdsOblgWidget extends StatefulWidget {
  const SearchProdsOblgWidget({Key? key}) : super(key: key);

  @override
  _SearchProdsOblgWidgetState createState() => _SearchProdsOblgWidgetState();
}

class _SearchProdsOblgWidgetState extends State<SearchProdsOblgWidget> {
  late SearchProdsOblgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchProdsOblgModel());

    _model.keySearchController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Form(
            key: _model.formKey2,
            autovalidateMode: AutovalidateMode.disabled,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                    child: TextFormField(
                      controller: _model.keySearchController,
                      onFieldSubmitted: (_) async {
                        logFirebaseEvent(
                            'SEARCH_PRODS_OBLG_keySearch_ON_TEXTFIELD');
                        logFirebaseEvent('keySearch_refresh_database_request');
                        setState(() => _model.apiRequestCompleter = null);
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter name prod...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 32.0, 20.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      validator: _model.keySearchControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 24.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).grayIcon,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'SEARCH_PRODS_OBLG_COMP_search_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_refresh_database_request');
                    setState(() => _model.apiRequestCompleter = null);
                    await _model.waitForApiRequestCompleted();
                  },
                ),
              ],
            ),
          ),
          AuthUserStreamWidget(
            builder: (context) => FutureBuilder<ApiCallResponse>(
              future:
                  (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(GetSearchProductsActivePharmaCall.call(
                          search: _model.keySearchController.text,
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
                final listViewGetSearchProductsActivePharmaResponse =
                    snapshot.data!;
                return Builder(
                  builder: (context) {
                    final prodsOblg = getJsonField(
                      listViewGetSearchProductsActivePharmaResponse.jsonBody,
                      r'''$''',
                    ).toList().take(20).toList();
                    return RefreshIndicator(
                      onRefresh: () async {
                        logFirebaseEvent(
                            'SEARCH_PRODS_OBLG_ListView_ahrb5r04_ON_P');
                        logFirebaseEvent('ListView_refresh_database_request');
                        setState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: prodsOblg.length,
                        itemBuilder: (context, prodsOblgIndex) {
                          final prodsOblgItem = prodsOblg[prodsOblgIndex];
                          return Form(
                            key: _model.formKey1,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Color(0x3416202A),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            getJsonField(
                                              prodsOblgItem,
                                              r'''$.name''',
                                            ).toString(),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SEARCH_PRODS_OBLG_COMP_add_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState().update(() {
                                            FFAppState().addToAddTaskProdsOblg(
                                                getJsonField(
                                              functions
                                                  .addQuantityInJsonProdOblgOrGift(
                                                      prodsOblgItem, 1.0),
                                              r'''$''',
                                            ));
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
