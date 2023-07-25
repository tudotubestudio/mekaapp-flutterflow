import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'codes_chat_model.dart';
export 'codes_chat_model.dart';

class CodesChatWidget extends StatefulWidget {
  const CodesChatWidget({Key? key}) : super(key: key);

  @override
  _CodesChatWidgetState createState() => _CodesChatWidgetState();
}

class _CodesChatWidgetState extends State<CodesChatWidget> {
  late CodesChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodesChatModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: FlutterFlowChoiceChips(
          options: [
            ChipData('Chiffre By OP', Icons.train_outlined),
            ChipData('Option 2 ', Icons.onetwothree_rounded)
          ],
          onChanged: (val) =>
              setState(() => _model.choiceChipsValue = val?.first),
          selectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
            iconColor: FlutterFlowTheme.of(context).primaryText,
            iconSize: 18.0,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(16.0),
          ),
          unselectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
            iconColor: FlutterFlowTheme.of(context).secondaryText,
            iconSize: 18.0,
            elevation: 0.0,
            borderRadius: BorderRadius.circular(16.0),
          ),
          chipSpacing: 12.0,
          rowSpacing: 12.0,
          multiselect: false,
          initialized: _model.choiceChipsValue != null,
          alignment: WrapAlignment.start,
          controller: _model.choiceChipsValueController ??=
              FormFieldController<List<String>>(
            ['Chiffre By OP'],
          ),
        ),
      ),
    );
  }
}
