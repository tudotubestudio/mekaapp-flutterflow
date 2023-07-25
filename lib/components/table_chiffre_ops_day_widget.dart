import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'table_chiffre_ops_day_model.dart';
export 'table_chiffre_ops_day_model.dart';

class TableChiffreOpsDayWidget extends StatefulWidget {
  const TableChiffreOpsDayWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _TableChiffreOpsDayWidgetState createState() =>
      _TableChiffreOpsDayWidgetState();
}

class _TableChiffreOpsDayWidgetState extends State<TableChiffreOpsDayWidget> {
  late TableChiffreOpsDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableChiffreOpsDayModel());

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
      height: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final op = getJsonField(
            widget.data,
            r'''$''',
          ).toList();
          return Container(
            height: double.infinity,
            child: DataTable2(
              columns: [
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Op',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Chiffre',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Perc',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
              ],
              rows: (op as Iterable)
                  .mapIndexed((opIndex, opItem) => [
                        Text(
                          getJsonField(
                            opItem,
                            r'''$.name''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Text(
                          formatNumber(
                            functions.jsonToDouble(getJsonField(
                              opItem,
                              r'''$.sum''',
                            )),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Text(
                          formatNumber(
                            functions.jsonToDouble(getJsonField(
                              opItem,
                              r'''$.sum_2''',
                            )),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                            currency: '%',
                          ),
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ].map((c) => DataCell(c)).toList())
                  .map((e) => DataRow(cells: e))
                  .toList(),
              headingRowColor: MaterialStateProperty.all(
                FlutterFlowTheme.of(context).primaryBackground,
              ),
              headingRowHeight: 46.0,
              dataRowColor: MaterialStateProperty.all(
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
              dataRowHeight: 46.0,
              border: TableBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              dividerThickness: 1.0,
              showBottomBorder: true,
              minWidth: 49.0,
            ),
          );
        },
      ),
    );
  }
}
