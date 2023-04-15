import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_payments_model.dart';
export 'add_payments_model.dart';

class AddPaymentsWidget extends StatefulWidget {
  const AddPaymentsWidget({Key? key}) : super(key: key);

  @override
  _AddPaymentsWidgetState createState() => _AddPaymentsWidgetState();
}

class _AddPaymentsWidgetState extends State<AddPaymentsWidget> {
  late AddPaymentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPaymentsModel());

    _model.yourNameController ??= TextEditingController();
    _model.cityController ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (isAndroid)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 100.0,
              icon: Icon(
                Icons.qr_code_scanner_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 90.0,
              ),
              onPressed: () async {
                logFirebaseEvent('ADD_PAYMENTS_qr_code_scanner_sharp_ICN_O');
                if (isAndroid) {
                  logFirebaseEvent('IconButton_scan_barcode_q_r_code');
                  _model.barcode = await FlutterBarcodeScanner.scanBarcode(
                    '#C62828', // scanning line color
                    'Cancel', // cancel button text
                    true, // whether to show the flash icon
                    ScanMode.QR,
                  );

                  logFirebaseEvent('IconButton_backend_call');
                  _model.apiResultyh6 =
                      await OrderMissionGroup.addPaymentCall.call(
                    token: valueOrDefault(currentUserDocument?.token, ''),
                    barecode: _model.barcode,
                  );
                  if ((_model.apiResultyh6?.succeeded ?? true)) {
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                    logFirebaseEvent('IconButton_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Payment added seccess',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).success,
                      ),
                    );
                  } else {
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                    logFirebaseEvent('IconButton_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Payment added error',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor:
                            FlutterFlowTheme.of(context).customColor3,
                      ),
                    );
                  }
                }

                setState(() {});
              },
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
          child: TextFormField(
            controller: _model.yourNameController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Your Name',
              labelStyle: FlutterFlowTheme.of(context).bodySmall,
              hintStyle: FlutterFlowTheme.of(context).bodySmall,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            maxLines: null,
            validator: _model.yourNameControllerValidator.asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
          child: TextFormField(
            controller: _model.cityController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Your City',
              labelStyle: FlutterFlowTheme.of(context).bodySmall,
              hintStyle: FlutterFlowTheme.of(context).bodySmall,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            maxLines: null,
            validator: _model.cityControllerValidator.asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
          child: FlutterFlowDropDown<String>(
            controller: _model.stateValueController ??=
                FormFieldController<String>(
              _model.stateValue ??= 'State',
            ),
            options: [
              'State',
              'Alabama',
              'Alaska',
              'Arizona',
              'Arkansas',
              'California',
              'Colorado',
              'Connecticut',
              'Delaware',
              'Florida',
              'Georgia',
              'Hawaii',
              'Idaho',
              'Illinoi',
              'Indiana',
              'Iowa',
              'Kansas',
              'Kentucky',
              'Louisiana',
              'Maine',
              'Maryland',
              'Massachusetts',
              'Michigan',
              'Minnesota',
              'Mississippi',
              'Missouri',
              'Monta',
              'Nebraska',
              'Nevada',
              'New Hampshire',
              'New Jersey',
              'New Mexico',
              'New York',
              'North Carolina',
              'North Dak',
              'Ohio',
              'Oklahoma',
              'Oregon',
              'Pennsylvani',
              'Rhode Island',
              'South Caroli',
              'South Dakota',
              'Tennessee',
              'Texas',
              'Utah',
              'Vermont',
              'Virginia',
              'Washingto',
              'West Virginia',
              'Wisconsin',
              'Wyoming'
            ],
            onChanged: (val) => setState(() => _model.stateValue = val),
            width: double.infinity,
            height: 56.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: 'Select State',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 15.0,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2.0,
            borderColor: FlutterFlowTheme.of(context).lineColor,
            borderWidth: 2.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
            hidesUnderline: true,
            isSearchable: false,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
          child: TextFormField(
            controller: _model.myBioController,
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: FlutterFlowTheme.of(context).bodySmall,
              hintText: 'Your bio',
              hintStyle: FlutterFlowTheme.of(context).bodySmall,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            textAlign: TextAlign.start,
            maxLines: 3,
            validator: _model.myBioControllerValidator.asValidator(context),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.05),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Save Changes',
              options: FFButtonOptions(
                width: 270.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
