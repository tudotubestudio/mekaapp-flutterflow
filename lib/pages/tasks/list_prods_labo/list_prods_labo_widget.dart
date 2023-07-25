import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_prods_labo_model.dart';
export 'list_prods_labo_model.dart';

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
  late ListProdsLaboModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListProdsLaboModel());

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: FlutterFlowTheme.of(context).backgroundComponents,
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
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
              value: _model.checkboxListTileValue1 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.checkboxListTileValue1 = newValue!);
              },
              title: Text(
                'Check all (${widget.labo})',
                style: FlutterFlowTheme.of(context).displaySmall,
              ),
              tileColor: Color(0xFFF5F5F5),
              activeColor: FlutterFlowTheme.of(context).primary,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
          AuthUserStreamWidget(
            builder: (context) => FutureBuilder<ApiCallResponse>(
              future: GetAllProductsActivePharmaCall.call(
                token: valueOrDefault(currentUserDocument?.token, ''),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final listViewGetAllProductsActivePharmaResponse =
                    snapshot.data!;
                return Builder(
                  builder: (context) {
                    final prodsLabo = listViewGetAllProductsActivePharmaResponse
                        .jsonBody
                        .toList();
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
                                  value: _model.checkboxListTileValueMap2[
                                      prodsLaboItem] ??= true,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.checkboxListTileValueMap2[
                                            prodsLaboItem] = newValue!);
                                  },
                                  title: Text(
                                    getJsonField(
                                      prodsLaboItem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
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
          ),
        ],
      ),
    );
  }
}
