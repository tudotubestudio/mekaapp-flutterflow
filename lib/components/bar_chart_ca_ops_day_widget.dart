import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bar_chart_ca_ops_day_model.dart';
export 'bar_chart_ca_ops_day_model.dart';

class BarChartCaOpsDayWidget extends StatefulWidget {
  const BarChartCaOpsDayWidget({
    Key? key,
    required this.perc,
    required this.ops,
  }) : super(key: key);

  final List<double>? perc;
  final List<String>? ops;

  @override
  _BarChartCaOpsDayWidgetState createState() => _BarChartCaOpsDayWidgetState();
}

class _BarChartCaOpsDayWidgetState extends State<BarChartCaOpsDayWidget> {
  late BarChartCaOpsDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarChartCaOpsDayModel());

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
      height: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: Container(
            width: double.infinity,
            height: 230.0,
            child: FlutterFlowBarChart(
              barData: [
                FFBarChartData(
                  yData: widget.perc!,
                  color: FlutterFlowTheme.of(context).primary,
                )
              ],
              xLabels: widget.ops!,
              barWidth: 16.0,
              barBorderRadius: BorderRadius.circular(8.0),
              groupSpace: 8.0,
              alignment: BarChartAlignment.spaceEvenly,
              chartStylingInfo: ChartStylingInfo(
                enableTooltip: true,
                tooltipBackgroundColor: FlutterFlowTheme.of(context).gray600,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                showGrid: true,
                showBorder: false,
              ),
              axisBounds: AxisBounds(),
              xAxisLabelInfo: AxisLabelInfo(
                title: 'Ops',
                titleTextStyle: TextStyle(
                  fontSize: 14.0,
                ),
                showLabels: true,
                labelTextStyle: TextStyle(),
                labelInterval: 10.0,
              ),
              yAxisLabelInfo: AxisLabelInfo(
                showLabels: true,
                labelInterval: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
