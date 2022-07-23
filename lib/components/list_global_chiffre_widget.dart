import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ListGlobalChiffreWidget extends StatefulWidget {
  const ListGlobalChiffreWidget({Key? key}) : super(key: key);

  @override
  _ListGlobalChiffreWidgetState createState() =>
      _ListGlobalChiffreWidgetState();
}

class _ListGlobalChiffreWidgetState extends State<ListGlobalChiffreWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Car',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      '\$425.24',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Due Sep 1, 2021',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14,
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
                          width: 110,
                          height: 40,
                          color: Color(0xFF3498DB),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
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
            height: 4,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFF1F4F8),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Remaining Payments',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '\$14,502',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF101213),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Text(
                    '/ \$24,999',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF3498DB),
                          fontSize: 16,
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
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                    child: StreamBuilder<List<RealisationObjDaysRecord>>(
                      stream: queryRealisationObjDaysRecord(
                        queryBuilder: (realisationObjDaysRecord) =>
                            realisationObjDaysRecord
                                .where('day',
                                    isGreaterThanOrEqualTo:
                                        listViewTasksRecord!.startDate)
                                .where('day',
                                    isLessThan: listViewTasksRecord!.endDate),
                        singleRecord: true,
                      ),
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
                        List<RealisationObjDaysRecord>
                            rowRealisationObjDaysRecordList = snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowRealisationObjDaysRecord =
                            rowRealisationObjDaysRecordList.first;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              dateTimeFormat(
                                  'yMMMd', listViewTasksRecord!.startDate!),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: LinearPercentIndicator(
                                  percent: functions.percTwoNum(
                                      rowRealisationObjDaysRecord!.realisation,
                                      listViewTasksRecord!.objectif),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  lineHeight: 16,
                                  animation: true,
                                  progressColor: Color(0xFF3498DB),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).lineColor,
                                  barRadius: Radius.circular(16),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'DA 330',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
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
