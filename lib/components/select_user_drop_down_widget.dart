import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectUserDropDownWidget extends StatefulWidget {
  const SelectUserDropDownWidget({Key? key}) : super(key: key);

  @override
  _SelectUserDropDownWidgetState createState() =>
      _SelectUserDropDownWidgetState();
}

class _SelectUserDropDownWidgetState extends State<SelectUserDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: FutureBuilder<ApiCallResponse>(
        future: UsersCall.call(),
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
          final listViewUsersResponse = snapshot.data!;
          return Builder(
            builder: (context) {
              final user = getJsonField(
                    (listViewUsersResponse?.jsonBody ?? ''),
                    r'''$''',
                  )?.toList() ??
                  [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: user.length,
                itemBuilder: (context, userIndex) {
                  final userItem = user[userIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: InkWell(
                      onTap: () async {
                        setState(() =>
                            FFAppState().taskDropDownUserId = getJsonField(
                              userItem,
                              r'''$.id''',
                            ));
                        setState(() =>
                            FFAppState().taskDropDownUserName = getJsonField(
                              userItem,
                              r'''$.name''',
                            ).toString());
                        Navigator.pop(context);
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        userItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        userItem,
                                        r'''$.created_at''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18,
                                  ),
                                ),
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
    );
  }
}
