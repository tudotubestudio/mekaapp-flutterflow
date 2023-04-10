// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:call_log/call_log.dart';

Future<String> getLogCall() async {
  // List<CallLogEntry> to json

  //Iterable<CallLogEntry> entries = await CallLog.get();
// QUERY CALL LOG (ALL PARAMS ARE OPTIONAL)
  var now = DateTime.now();
  int from = now.subtract(Duration(days: 3)).millisecondsSinceEpoch;
  //int to = now.subtract(Duration(days: 30)).millisecondsSinceEpoch;
  Iterable<CallLogEntry> entries = await CallLog.query(
    dateFrom: from,
    //dateTo: to,
    //durationFrom: 0,
    //durationTo: 60,
    //name: 'John Doe',
    //number: '901700000',
    //type: CallType.incoming,
  );

  List<String> logs = [];

  for (var item in entries) {
    logs.add('{' +
        "name" +
        ':' +
        jsonEncode(item.name) +
        ','
            "number" +
        ':' +
        jsonEncode(item.number) +
        ','
            "callType" +
        ':' +
        jsonEncode(item.callType) +
        ','
            "timestamp" +
        ':' +
        jsonEncode(item.timestamp) +
        ','
            "duration" +
        ':' +
        jsonEncode(item.duration) +
        '}');
  }

  //List<CallLogEntry> logsFilter = [];

  return logs.toString();
}
