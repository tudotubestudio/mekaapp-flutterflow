// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class TimerReserve extends StatefulWidget {
  const TimerReserve({
    Key? key,
    this.width,
    this.height,
    this.time,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? time;
  final Color? color;

  @override
  _TimerReserveState createState() => _TimerReserveState();
}

class _TimerReserveState extends State<TimerReserve> {
  @override
  void initState() {
    _start = widget.time!;
    startTimer();
    super.initState();
  }

  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Timer? _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${(_start / 60).truncate()}:${_start - ((_start / 60).truncate() * 60)}",
      style: TextStyle(color: widget.color),
    );
  }
}
