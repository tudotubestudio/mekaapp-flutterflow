import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_list_prods_model.dart';
export 'create_list_prods_model.dart';

class CreateListProdsWidget extends StatefulWidget {
  const CreateListProdsWidget({Key? key}) : super(key: key);

  @override
  _CreateListProdsWidgetState createState() => _CreateListProdsWidgetState();
}

class _CreateListProdsWidgetState extends State<CreateListProdsWidget> {
  late CreateListProdsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateListProdsModel());

    _model.nameListController ??= TextEditingController();
    _model.keySearchListController ??= TextEditingController();
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 4,
                      child: AuthUserStreamWidget(
                        builder: (context) => FutureBuilder<ApiCallResponse>(
                          future: GetAllLabosActiveCall.call(
                            token:
                                valueOrDefault(currentUserDocument?.token, ''),
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
                            final dropDownLabosGetAllLabosActiveResponse =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownLabosValueController ??=
                                      FormFieldController<String>(null),
                              options: (GetAllLabosActiveCall.listNames(
                                dropDownLabosGetAllLabosActiveResponse.jsonBody,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()!
                                  .toList(),
                              onChanged: (val) => setState(
                                  () => _model.dropDownLabosValue = val),
                              width: 180.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Please select list...',
                              fillColor: FlutterFlowTheme.of(context).lineColor,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 0.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                            );
                          },
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
                        color: FlutterFlowTheme.of(context).grayIcon,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CREATE_LIST_PRODS_COMP_add_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_backend_call');
                        _model.resProds =
                            await GetSearchProductsActivePharmaCall.call(
                          labo: _model.dropDownLabosValue,
                          token: valueOrDefault(currentUserDocument?.token, ''),
                        );
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().update(() {
                          FFAppState().addTaskListProdsSelect = functions
                              .jsonToListJson((_model.resProds?.jsonBody ?? ''),
                                  FFAppState().addTaskListProdsSelect.toList())
                              .toList();
                        });

                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
          child: TextFormField(
            controller: _model.nameListController,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.nameListController',
              Duration(milliseconds: 1000),
              () => setState(() {}),
            ),
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Enter name list...',
              hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
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
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 12.0),
              suffixIcon: _model.nameListController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () async {
                        _model.nameListController?.clear();
                        setState(() {});
                      },
                      child: Icon(
                        Icons.clear,
                        color: Color(0xFF757575),
                        size: 22.0,
                      ),
                    )
                  : null,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF101213),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.start,
            validator: _model.nameListControllerValidator.asValidator(context),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: TextFormField(
                controller: _model.keySearchListController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.keySearchListController',
                  Duration(milliseconds: 1000),
                  () => setState(() {}),
                ),
                onFieldSubmitted: (_) async {
                  logFirebaseEvent('CREATE_LIST_PRODS_keySearchList_ON_TEXTF');
                  logFirebaseEvent('keySearchList_refresh_database_request');
                  setState(() => _model.apiRequestCompleter = null);
                  await _model.waitForApiRequestCompleted(
                      minWait: 2, maxWait: 10);
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter name prod...',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
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
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 12.0),
                  suffixIcon: _model.keySearchListController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.keySearchListController?.clear();
                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            color: Color(0xFF757575),
                            size: 22.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF101213),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                validator: _model.keySearchListControllerValidator
                    .asValidator(context),
              ),
            ),
            if (_model.keySearchListController.text != null &&
                _model.keySearchListController.text != '')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 70.0, 16.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??= Completer<
                                      ApiCallResponse>()
                                    ..complete(
                                        GetSearchProductsActivePharmaCall.call(
                                      search:
                                          _model.keySearchListController.text,
                                      token: valueOrDefault(
                                          currentUserDocument?.token, ''),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                final listViewGetSearchProductsActivePharmaResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final prodsSerach = getJsonField(
                                      listViewGetSearchProductsActivePharmaResponse
                                          .jsonBody,
                                      r'''$''',
                                    ).toList().take(20).toList();
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'CREATE_LIST_PRODS_ListView_l699hrga_ON_P');
                                        logFirebaseEvent(
                                            'ListView_refresh_database_request');
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: prodsSerach.length,
                                        itemBuilder:
                                            (context, prodsSerachIndex) {
                                          final prodsSerachItem =
                                              prodsSerach[prodsSerachIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 8.0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CREATE_LIST_PRODS_contentView_0_ON_TAP');
                                                logFirebaseEvent(
                                                    'contentView_0_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .addToAddTaskProdsGift(
                                                          prodsSerachItem);
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5.0,
                                                      color: Color(0x3416202A),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                                                              prodsSerachItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 24.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'CREATE_LIST_PRODS_COMP_add_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                .addToAddTaskListProdsSelect(
                                                                    prodsSerachItem);
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'List prods',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).grayIcon,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final prodsList = FFAppState().addTaskListProdsSelect.toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: prodsList.length,
                itemBuilder: (context, prodsListIndex) {
                  final prodsListItem = prodsList[prodsListIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 8.0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'CREATE_LIST_PRODS_contentView_0_ON_TAP');
                        logFirebaseEvent('contentView_0_update_app_state');
                        FFAppState().update(() {
                          FFAppState().addToAddTaskProdsGift(prodsListItem);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: AutoSizeText(
                                    getJsonField(
                                      prodsListItem,
                                      r'''$.name''',
                                    ).toString(),
                                    maxLines: 2,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CREATE_LIST_PRODS_COMP_close_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromAddTaskListProdsSelect(
                                            prodsListItem);
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
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CREATE_LIST_PRODS_CREATE_LIST_BTN_ON_TAP');
                      logFirebaseEvent('Button_custom_action');
                      _model.listProdsSelectString =
                          await actions.listJsonToString(
                        FFAppState().addTaskListProdsSelect.toList(),
                      );
                      logFirebaseEvent('Button_backend_call');
                      _model.rAddList = await TaskAddListCall.call(
                        name: _model.nameListController.text,
                        products: _model.listProdsSelectString,
                        token: valueOrDefault(currentUserDocument?.token, ''),
                      );
                      if ((_model.rAddList?.succeeded ?? true)) {
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                      } else {
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('No added list'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      setState(() {});
                    },
                    text: 'Create List',
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
