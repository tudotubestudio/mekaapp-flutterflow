import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchProdsOblgWidget extends StatefulWidget {
  const SearchProdsOblgWidget({Key? key}) : super(key: key);

  @override
  _SearchProdsOblgWidgetState createState() => _SearchProdsOblgWidgetState();
}

class _SearchProdsOblgWidgetState extends State<SearchProdsOblgWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  TextEditingController? keySearchController;
  TextEditingController? qProdOblgController;
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    keySearchController = TextEditingController();
    qProdOblgController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          key: formKey2,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: TextFormField(
              controller: keySearchController,
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
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF757575),
                  size: 22,
                ),
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
        ),
        Expanded(
          child: FutureBuilder<ApiCallResponse>(
            future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(GetSearchProductsActivePharmaCall.call(
                    search: keySearchController!.text,
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
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final listViewGetSearchProductsActivePharmaResponse =
                  snapshot.data!;
              return Builder(
                builder: (context) {
                  final prodsOblg = (getJsonField(
                            (listViewGetSearchProductsActivePharmaResponse
                                    ?.jsonBody ??
                                ''),
                            r'''$''',
                          )?.toList() ??
                          [])
                      .take(20)
                      .toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: prodsOblg.length,
                    itemBuilder: (context, prodsOblgIndex) {
                      final prodsOblgItem = prodsOblg[prodsOblgIndex];
                      return Form(
                        key: formKey1,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50,
                                    child: TextFormField(
                                      controller: qProdOblgController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 8, 8, 8),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF101213),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: AutoSizeText(
                                        getJsonField(
                                          prodsOblgItem,
                                          r'''$.name''',
                                        ).toString(),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.add,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      setState(() => FFAppState()
                                          .addTaskProdsOblg
                                          .add(getJsonField(
                                            functions
                                                .addQuantityInJsonProdOblgOrGift(
                                                    prodsOblgItem,
                                                    double.parse(
                                                        qProdOblgController!
                                                            .text)),
                                            r'''$''',
                                          )));
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
              );
            },
          ),
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
