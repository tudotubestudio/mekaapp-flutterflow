import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateListProdsWidget extends StatefulWidget {
  const CreateListProdsWidget({Key? key}) : super(key: key);

  @override
  _CreateListProdsWidgetState createState() => _CreateListProdsWidgetState();
}

class _CreateListProdsWidgetState extends State<CreateListProdsWidget> {
  ApiCallResponse? rAddList;
  String? listProdsSelectString;
  ApiCallResponse? resProds;
  String? dropDownLabosValue;
  TextEditingController? nameListController;
  Completer<ApiCallResponse>? _apiRequestCompleter;
  TextEditingController? keySearchListController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    keySearchListController = TextEditingController();
    nameListController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 4,
                      child: FutureBuilder<ApiCallResponse>(
                        future: GetAllLabosActiveCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final dropDownLabosGetAllLabosActiveResponse =
                              snapshot.data!;
                          return FlutterFlowDropDown(
                            options: (GetAllLabosActiveCall.listNames(
                              (dropDownLabosGetAllLabosActiveResponse
                                      ?.jsonBody ??
                                  ''),
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownLabosValue = val),
                            width: 180,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Please select list...',
                            fillColor: FlutterFlowTheme.of(context).lineColor,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          );
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).grayIcon,
                        size: 30,
                      ),
                      onPressed: () async {
                        resProds = await GetSearchProductsActivePharmaCall.call(
                          labo: dropDownLabosValue,
                        );
                        setState(() => FFAppState().addTaskListProdsSelect =
                            functions
                                .jsonToListJson(
                                    (resProds!?.jsonBody ?? ''),
                                    FFAppState()
                                        .addTaskListProdsSelect!
                                        .toList())
                                .toList());

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
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: TextFormField(
            controller: nameListController,
            onChanged: (_) => EasyDebounce.debounce(
              'nameListController',
              Duration(milliseconds: 2000),
              () => setState(() {}),
            ),
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Enter name list...',
              hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1F4F8),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1F4F8),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).lineColor,
              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
              suffixIcon: nameListController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () => setState(
                        () => nameListController?.clear(),
                      ),
                      child: Icon(
                        Icons.clear,
                        color: Color(0xFF757575),
                        size: 22,
                      ),
                    )
                  : null,
            ),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF101213),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.number,
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
              child: TextFormField(
                controller: keySearchListController,
                onChanged: (_) => EasyDebounce.debounce(
                  'keySearchListController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                onFieldSubmitted: (_) async {
                  setState(() => _apiRequestCompleter = null);
                  await waitForApiRequestCompleter(minWait: 2, maxWait: 10);
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter name prod...',
                  hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).lineColor,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                  suffixIcon: keySearchListController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => keySearchListController?.clear(),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF101213),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
            ),
            if ((keySearchListController!.text != null &&
                keySearchListController!.text != ''))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 70, 16, 16),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(12),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_apiRequestCompleter ??= Completer<
                                    ApiCallResponse>()
                                  ..complete(
                                      GetSearchProductsActivePharmaCall.call(
                                    search: keySearchListController!.text,
                                  )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final listViewGetSearchProductsActivePharmaResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final prodsSerach = (getJsonField(
                                            (listViewGetSearchProductsActivePharmaResponse
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$''',
                                          )?.toList() ??
                                          [])
                                      .take(20)
                                      .toList();
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(
                                          () => _apiRequestCompleter = null);
                                      await waitForApiRequestCompleter();
                                    },
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: prodsSerach.length,
                                      itemBuilder: (context, prodsSerachIndex) {
                                        final prodsSerachItem =
                                            prodsSerach[prodsSerachIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 8),
                                          child: InkWell(
                                            onTap: () async {
                                              setState(() => FFAppState()
                                                  .addTaskProdsGift
                                                  .add(prodsSerachItem));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color(0x3416202A),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: AutoSizeText(
                                                          getJsonField(
                                                            prodsSerachItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2,
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 24,
                                                      borderWidth: 1,
                                                      buttonSize: 60,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                      onPressed: () async {
                                                        setState(() => FFAppState()
                                                            .addTaskListProdsSelect
                                                            .add(
                                                                prodsSerachItem));
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
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'List prods',
                style: FlutterFlowTheme.of(context).subtitle1.override(
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
              final prodsList =
                  FFAppState().addTaskListProdsSelect!?.toList() ?? [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: prodsList.length,
                itemBuilder: (context, prodsListIndex) {
                  final prodsListItem = prodsList[prodsListIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                    child: InkWell(
                      onTap: () async {
                        setState(() =>
                            FFAppState().addTaskProdsGift.add(prodsListItem));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3416202A),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: AutoSizeText(
                                    getJsonField(
                                      prodsListItem,
                                      r'''$.name''',
                                    ).toString(),
                                    maxLines: 2,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).customColor3,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  setState(() => FFAppState()
                                      .addTaskListProdsSelect
                                      .remove(prodsListItem));
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
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                  child: FFButtonWidget(
                    onPressed: () async {
                      listProdsSelectString = await actions.listJsonToString(
                        FFAppState().addTaskListProdsSelect!.toList(),
                      );
                      rAddList = await TaskAddListCall.call(
                        name: nameListController!.text,
                        products: listProdsSelectString,
                      );
                      if ((rAddList!?.succeeded ?? true)) {
                        Navigator.pop(context);
                      } else {
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
                      width: 270,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
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

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
