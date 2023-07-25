// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:call_log/call_log.dart';

Future<List<dynamic>> callLogs() async {
  // list Object To list Json

// GET WHOLE CALL LOG
  Iterable<CallLogEntry> entries = await CallLog.get();

// QUERY CALL LOG (ALL PARAMS ARE OPTIONAL)
  var now = DateTime.now();
  int from = now.subtract(Duration(days: 3)).millisecondsSinceEpoch;
  //int to = now.subtract(Duration(days: 30)).millisecondsSinceEpoch;
  // Iterable<CallLogEntry> entries = await CallLog.query(
  //   dateFrom: from,
  //   //dateTo: to,
  //   //durationFrom: 0,
  //   //durationTo: 60,
  //   //name: 'John Doe',
  //   //number: '901700000',
  //   //type: CallType.incoming,
  // );

  List<CallLogEntry> logs = entries.toList();
  List<dynamic> list = [];
  for (var i = 0; i < logs.length; i++) {
    list.add({
      "name": logs[i].name,
      "number": logs[i].number,
      "callType": logs[i].callType,
      "timestamp": logs[i].timestamp,
      "duration": logs[i].duration,
    });
  }
  return list;
}
