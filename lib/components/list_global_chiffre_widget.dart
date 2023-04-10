import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'list_global_chiffre_model.dart';
export 'list_global_chiffre_model.dart';

class ListGlobalChiffreWidget extends StatefulWidget {
  const ListGlobalChiffreWidget({Key? key}) : super(key: key);

  @override
  _ListGlobalChiffreWidgetState createState() =>
      _ListGlobalChiffreWidgetState();
}

class _ListGlobalChiffreWidgetState extends State<ListGlobalChiffreWidget> {
  late ListGlobalChiffreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListGlobalChiffreModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Car',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      '\$425.24',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 36.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        'Due Sep 1, 2021',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'LIST_GLOBAL_CHIFFRE_PAY_EARLY_BTN_ON_TAP');
                          logFirebaseEvent('Button_backend_call');

                          final giftsCreateData = createGiftsRecordData(
                            type: 1,
                            total: 550.0,
                            createdAt: getCurrentTimestamp,
                            createdBy: currentUserReference,
                            updatedAt: getCurrentTimestamp,
                            updatedBy: currentUserReference,
                          );
                          await GiftsRecord.collection
                              .doc()
                              .set(giftsCreateData);
                        },
                        text: 'Pay Early',
                        options: FFButtonOptions(
                          width: 110.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF3498DB),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 4.0,
            thickness: 2.0,
            indent: 20.0,
            endIndent: 20.0,
            color: Color(0xFFF1F4F8),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Remaining Payments',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '\$14,502',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF101213),
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Text(
                    '/ \$24,999',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF3498DB),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<List<TasksRecord>>(
            stream: queryTasksRecord(),
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
              List<TasksRecord> listViewTasksRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewTasksRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTasksRecord =
                      listViewTasksRecordList[listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: StreamBuilder<List<RealisationObjDaysRecord>>(
                      stream: queryRealisationObjDaysRecord(
                        queryBuilder: (realisationObjDaysRecord) =>
                            realisationObjDaysRecord
                                .where('day',
                                    isGreaterThanOrEqualTo:
                                        listViewTasksRecord.startDate)
                                .where('day',
                                    isLessThan: listViewTasksRecord.endDate),
                        singleRecord: true,
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
                        List<RealisationObjDaysRecord>
                            rowRealisationObjDaysRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowRealisationObjDaysRecord =
                            rowRealisationObjDaysRecordList.isNotEmpty
                                ? rowRealisationObjDaysRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              dateTimeFormat(
                                  'yMMMd', listViewTasksRecord.startDate!),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: LinearPercentIndicator(
                                  percent: functions.percTwoNum(
                                      rowRealisationObjDaysRecord!.realisation,
                                      listViewTasksRecord.objectif),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  lineHeight: 16.0,
                                  animation: true,
                                  progressColor: Color(0xFF3498DB),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).lineColor,
                                  barRadius: Radius.circular(16.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'DA 330',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF2ECC71),
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
