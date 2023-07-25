import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_products_date_proches_this_week_model.dart';
export 'log_products_date_proches_this_week_model.dart';

class LogProductsDateProchesThisWeekWidget extends StatefulWidget {
  const LogProductsDateProchesThisWeekWidget({Key? key}) : super(key: key);

  @override
  _LogProductsDateProchesThisWeekWidgetState createState() =>
      _LogProductsDateProchesThisWeekWidgetState();
}

class _LogProductsDateProchesThisWeekWidgetState
    extends State<LogProductsDateProchesThisWeekWidget> {
  late LogProductsDateProchesThisWeekModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogProductsDateProchesThisWeekModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Log_products_date_proches_this_week'});
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
              logFirebaseEvent('LOG_PRODUCTS_DATE_PROCHES_THIS_WEEK_arro');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Logs',
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: DateProchesThisWeekCall.call(),
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
                    final listViewDateProchesThisWeekResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final logProds = DateProchesThisWeekCall.data(
                          listViewDateProchesThisWeekResponse.jsonBody,
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: logProds.length,
                          itemBuilder: (context, logProdsIndex) {
                            final logProdsItem = logProds[logProdsIndex];
                            return ListTile(
                              leading: Icon(
                                Icons.sd_storage,
                              ),
                              title: Text(
                                getJsonField(
                                  logProdsItem,
                                  r'''$.name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                              subtitle: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20.0,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
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
          ),
        ),
      ),
    );
  }
}
