import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'table_my_quotas_model.dart';
export 'table_my_quotas_model.dart';

class TableMyQuotasWidget extends StatefulWidget {
  const TableMyQuotasWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _TableMyQuotasWidgetState createState() => _TableMyQuotasWidgetState();
}

class _TableMyQuotasWidgetState extends State<TableMyQuotasWidget> {
  late TableMyQuotasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableMyQuotasModel());

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
      height: double.infinity,
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
                      'Product',
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Rest',
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
                            r'''$.product''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Text(
                          formatNumber(
                            functions.jsonToDouble(getJsonField(
                              opItem,
                              r'''$.rest''',
                            )),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
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
