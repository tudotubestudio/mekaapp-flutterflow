import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListProdsLaboWidget extends StatefulWidget {
  const ListProdsLaboWidget({
    Key? key,
    this.labo,
  }) : super(key: key);

  final String? labo;

  @override
  _ListProdsLaboWidgetState createState() => _ListProdsLaboWidgetState();
}

class _ListProdsLaboWidgetState extends State<ListProdsLaboWidget> {
  Map<ApiCallResponse?, bool> checkboxListTileValueMap2 = {};
  List<ApiCallResponse?> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  bool? checkboxListTileValue1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: FlutterFlowTheme.of(context).backgroundComponents,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Color(0xFF95A1AC),
            ),
            child: CheckboxListTile(
              value: checkboxListTileValue1 ??= true,
              onChanged: (newValue) =>
                  setState(() => checkboxListTileValue1 = newValue!),
              title: Text(
                'Check all (${widget.labo})',
                style: FlutterFlowTheme.of(context).title1,
              ),
              tileColor: Color(0xFFF5F5F5),
              activeColor: FlutterFlowTheme.of(context).primaryColor,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
          FutureBuilder<ApiCallResponse>(
            future: GetAllProductsActivePharmaCall.call(),
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
              final listViewGetAllProductsActivePharmaResponse = snapshot.data!;
              return Builder(
                builder: (context) {
                  final prodsLabo =
                      (listViewGetAllProductsActivePharmaResponse?.jsonBody ??
                                  '')
                              ?.toList() ??
                          [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: prodsLabo.length,
                    itemBuilder: (context, prodsLaboIndex) {
                      final prodsLaboItem = prodsLabo[prodsLaboIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value:
                                    checkboxListTileValueMap2[prodsLaboItem] ??=
                                        true,
                                onChanged: (newValue) => setState(() =>
                                    checkboxListTileValueMap2[prodsLaboItem] =
                                        newValue!),
                                title: Text(
                                  getJsonField(
                                    prodsLaboItem,
                                    r'''$.name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
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
    );
  }
}
