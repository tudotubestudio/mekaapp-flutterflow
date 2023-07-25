import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BarChartCaOpsDayModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<double> perc = [];
  void addToPerc(double item) => perc.add(item);
  void removeFromPerc(double item) => perc.remove(item);
  void removeAtIndexFromPerc(int index) => perc.removeAt(index);
  void updatePercAtIndex(int index, Function(double) updateFn) =>
      perc[index] = updateFn(perc[index]);

  List<String> ops = [];
  void addToOps(String item) => ops.add(item);
  void removeFromOps(String item) => ops.remove(item);
  void removeAtIndexFromOps(int index) => ops.removeAt(index);
  void updateOpsAtIndex(int index, Function(String) updateFn) =>
      ops[index] = updateFn(ops[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
