import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogProductsDateProchesThisWeekWidget extends StatefulWidget {
  const LogProductsDateProchesThisWeekWidget({Key? key}) : super(key: key);

  @override
  _LogProductsDateProchesThisWeekWidgetState createState() =>
      _LogProductsDateProchesThisWeekWidgetState();
}

class _LogProductsDateProchesThisWeekWidgetState
    extends State<LogProductsDateProchesThisWeekWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Logs',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              subtitle: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
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
