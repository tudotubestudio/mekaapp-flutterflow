import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/search_prods_gift_widget.dart';
import '/components/search_prods_oblg_widget.dart';
import '/components/select_list_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_task_copy_model.dart';
export 'add_task_copy_model.dart';

class AddTaskCopyWidget extends StatefulWidget {
  const AddTaskCopyWidget({Key? key}) : super(key: key);

  @override
  _AddTaskCopyWidgetState createState() => _AddTaskCopyWidgetState();
}

class _AddTaskCopyWidgetState extends State<AddTaskCopyWidget> {
  late AddTaskCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTaskCopyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'addTaskCopy'});
    _model.titleTaskController ??= TextEditingController();
    _model.descriptionController ??= TextEditingController();
    _model.titleController ??= TextEditingController(text: '1');
    _model.objectif1Controller ??= TextEditingController();
    _model.percReal1Controller ??= TextEditingController();
    _model.giftMoney1Controller ??= TextEditingController(text: '0');
    _model.percGiftMoney1Controller ??= TextEditingController(text: '0');
    _model.giftChiffre1Controller ??= TextEditingController(text: '0');
    _model.percGiftChiffre1Controller ??= TextEditingController(text: '0');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_TASK_COPY_PAGE_arrow_back_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                      Text(
                        'Create Task',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF101213),
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'Find members by searching below',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownTypeTaskController ??=
                                FormFieldController<String>(null),
                            options: [
                              'Chiffre',
                              'Chiffre Op',
                              'Chiffre Group',
                              'Task',
                              'Déblocage client',
                              'Suivi facts reciption',
                              'Suivi preparation commands',
                              'Suivi send etat client',
                              'Recouvrement',
                              'Recouvrement Op',
                              'Recouvrement Livreur',
                              'Recouvrement Group',
                              'Recouvrement Delegue',
                              'Demende Achat Produit',
                              'Suivi livraison colis',
                              'Suivi Chiffre by region',
                              'Destockage labo',
                              'Destockage date proche',
                              'Destockage stagnante',
                              'Pack'
                            ],
                            onChanged: (val) => setState(
                                () => _model.dropDownTypeTaskValue = val),
                            width: 180.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Please select type task...',
                            fillColor: FlutterFlowTheme.of(context).lineColor,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 0.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.titleTaskController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter title...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
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
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 32.0, 20.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      validator: _model.titleTaskControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.descriptionController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter description...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
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
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 32.0, 20.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      validator: _model.descriptionControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 15.0),
                                    child: Text(
                                      FFAppState().addTaskDateStart,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.date_range,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_TASK_COPY_PAGE_date_range_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_date_time_picker');
                                    final _datePicked1Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePicked1Date != null) {
                                      setState(() {
                                        _model.datePicked1 = DateTime(
                                          _datePicked1Date.year,
                                          _datePicked1Date.month,
                                          _datePicked1Date.day,
                                        );
                                      });
                                    }
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().update(() {
                                      FFAppState().addTaskDateStart =
                                          dateTimeFormat(
                                              'd/M/y', _model.datePicked1);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 15.0),
                                    child: Text(
                                      FFAppState().addTaskDateEnd,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.date_range,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_TASK_COPY_PAGE_date_range_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_date_time_picker');
                                    final _datePicked2Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePicked2Date != null) {
                                      setState(() {
                                        _model.datePicked2 = DateTime(
                                          _datePicked2Date.year,
                                          _datePicked2Date.month,
                                          _datePicked2Date.day,
                                        );
                                      });
                                    }
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().update(() {
                                      FFAppState().addTaskDateEnd =
                                          dateTimeFormat(
                                              'd/M/y', _model.datePicked2);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SwitchListTile(
                              value: _model.switchListTileListProdsValue ??=
                                  false,
                              onChanged: (newValue) async {
                                setState(() => _model
                                    .switchListTileListProdsValue = newValue!);
                              },
                              title: Text(
                                'List',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                            if (_model.switchListTileListProdsValue ?? true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ADD_TASK_COPY_Container_6d8y5eha_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                            barrierColor: Color(0x00000000),
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.75,
                                                    child:
                                                        SelectListDropDownWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                                  child: Text(
                                                    FFAppState()
                                                        .taskDropDownListName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  size: 30.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: SwitchListTile(
                                value: _model.switchListTileRepeatValue ??=
                                    false,
                                onChanged: (newValue) async {
                                  setState(() => _model
                                      .switchListTileRepeatValue = newValue!);
                                },
                                title: Text(
                                  'Repeat',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                            if (_model.switchListTileRepeatValue ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _model.titleController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFF1F4F8),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 32.0, 20.0, 12.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF101213),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          textAlign: TextAlign.center,
                                          validator: _model
                                              .titleControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownRepeatController ??=
                                              FormFieldController<String>(null),
                                          options: ['Weeks', 'Months', 'Years'],
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownRepeatValue = val),
                                          width: 180.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'repeat every...',
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineColor,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.dropDownRepeatValue == 'Weeks')
                                        Expanded(
                                          child: Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValue1 ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValue1 =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    'Samedi',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              ),
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValue2 ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValue2 =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    'Lundi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              ),
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValue3 ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValue3 =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    'Mardi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              ),
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValue4 ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValue4 =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    'Mercredi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              ),
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValue5 ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValue5 =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    'Jeudi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              ),
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Color(0xFF95A1AC),
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValue6 ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValue6 =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    'Vendredi',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> userUsersRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.userController ??=
                                    FormFieldController<String>(null),
                                options: userUsersRecordList
                                    .map((e) => e.displayName)
                                    .withoutNulls
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => _model.userValue = val),
                                width: 180.0,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Please select user...',
                                fillColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: SwitchListTile(
                                value: _model.switchListTileProdsOblgValue ??=
                                    false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileProdsOblgValue =
                                          newValue!);
                                },
                                title: Text(
                                  'Produit Oblg',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                            if (_model.switchListTileProdsOblgValue ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 12.0,
                                            borderWidth: 1.0,
                                            buttonSize: 50.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            icon: Icon(
                                              Icons.add,
                                              color: Color(0xFF95A5A6),
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ADD_TASK_COPY_PAGE_add_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (bottomSheetContext) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                _unfocusNode),
                                                    child: Padding(
                                                      padding: MediaQuery.of(
                                                              bottomSheetContext)
                                                          .viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        child:
                                                            SearchProdsOblgWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final prodsOblg = FFAppState()
                                          .addTaskProdsOblg
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: prodsOblg.length,
                                        itemBuilder: (context, prodsOblgIndex) {
                                          final prodsOblgItem =
                                              prodsOblg[prodsOblgIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      prodsOblgItem,
                                                      r'''$.quantity''',
                                                    ).toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      prodsOblgItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFE74C3C),
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADD_TASK_COPY_PAGE_close_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .removeFromAddTaskProdsOblg(
                                                            prodsOblgItem);
                                                  });
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SwitchListTile(
                              value: _model.switchListTileObj1Value ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileObj1Value = newValue!);
                              },
                              title: Text(
                                'Obj 1\n',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                            if (_model.switchListTileObj1Value ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.objectif1Controller,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.objectif1Controller',
                                        Duration(milliseconds: 1000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Objectif (1)...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 32.0, 20.0, 12.0),
                                        suffixIcon: _model.objectif1Controller!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.objectif1Controller
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF101213),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .objectif1ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.percReal1Controller,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.percReal1Controller',
                                        Duration(milliseconds: 1000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Perc (1)...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 32.0, 20.0, 12.0),
                                        suffixIcon: _model.percReal1Controller!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.percReal1Controller
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF101213),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .percReal1ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 400.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.0, 1.0, 1.0, 1.0),
                                      child: DefaultTabController(
                                        length: 3,
                                        initialIndex: 0,
                                        child: Column(
                                          children: [
                                            TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              tabs: [
                                                Tab(
                                                  text: 'Money',
                                                  icon: Icon(
                                                    Icons.attach_money_outlined,
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Chiffre Quota',
                                                  icon: Icon(
                                                    Icons.looks_one_outlined,
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Prods Gift',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .productHunt,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowRadioButton(
                                                          options: [
                                                            'Chiffre',
                                                            'Perc'
                                                          ].toList(),
                                                          onChanged: (val) =>
                                                              setState(() {}),
                                                          controller: _model
                                                                  .radioButtonTypeMoney1Controller ??=
                                                              FormFieldController<
                                                                      String>(
                                                                  'Chiffre'),
                                                          optionHeight: 25.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                          buttonPosition:
                                                              RadioButtonPosition
                                                                  .left,
                                                          direction:
                                                              Axis.horizontal,
                                                          radioButtonColor:
                                                              Colors.blue,
                                                          inactiveRadioButtonColor:
                                                              Color(0x8A000000),
                                                          toggleable: false,
                                                          horizontalAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                      if (_model
                                                              .radioButtonTypeMoney1Value ==
                                                          'Chiffre')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .giftMoney1Controller,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Gift money',
                                                                    hintText:
                                                                        'Gift money...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            32.0,
                                                                            20.0,
                                                                            12.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .giftMoney1ControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Text(
                                                                'DA',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (_model
                                                              .radioButtonTypeMoney1Value ==
                                                          'Perc')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .percGiftMoney1Controller,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Gift money',
                                                                    hintText:
                                                                        'Gift money...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            32.0,
                                                                            20.0,
                                                                            12.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .percGiftMoney1ControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Text(
                                                                '%',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowRadioButton(
                                                          options: [
                                                            'Chiffre',
                                                            'Perc'
                                                          ].toList(),
                                                          onChanged: (val) =>
                                                              setState(() {}),
                                                          controller: _model
                                                                  .radioButtonTypeChiffre1Controller ??=
                                                              FormFieldController<
                                                                      String>(
                                                                  'Chiffre'),
                                                          optionHeight: 25.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                          buttonPosition:
                                                              RadioButtonPosition
                                                                  .left,
                                                          direction:
                                                              Axis.horizontal,
                                                          radioButtonColor:
                                                              Colors.blue,
                                                          inactiveRadioButtonColor:
                                                              Color(0x8A000000),
                                                          toggleable: false,
                                                          horizontalAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                        ),
                                                      ),
                                                      if (_model
                                                              .radioButtonTypeChiffre1Value ==
                                                          'Chiffre')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .giftChiffre1Controller,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Gift chiffre quota',
                                                                    hintText:
                                                                        'Gift chiffre quota...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            32.0,
                                                                            20.0,
                                                                            12.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .giftChiffre1ControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Text(
                                                                'DA',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (_model
                                                              .radioButtonTypeChiffre1Value ==
                                                          'Perc')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .percGiftChiffre1Controller,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Perc gift chiffre quota',
                                                                    hintText:
                                                                        'Perc gift chiffre quota...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            32.0,
                                                                            20.0,
                                                                            12.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .percGiftChiffre1ControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Text(
                                                                '%',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    12.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    50.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: Color(
                                                                      0xFF95A5A6),
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ADD_TASK_COPY_PAGE_add_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (bottomSheetContext) {
                                                                      return GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(context).requestFocus(_unfocusNode),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.of(bottomSheetContext).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.5,
                                                                            child:
                                                                                SearchProdsGiftWidget(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final prodsGift =
                                                                      FFAppState()
                                                                          .addTaskProdsGift
                                                                          .toList();
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        prodsGift
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            prodsGiftIndex) {
                                                                      final prodsGiftItem =
                                                                          prodsGift[
                                                                              prodsGiftIndex];
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  prodsGiftItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                60.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.close,
                                                                              color: Color(0xFFE74C3C),
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('ADD_TASK_COPY_PAGE_close_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().removeFromAddTaskProdsGift(prodsGiftItem);
                                                                              });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where('display_name',
                                        isEqualTo: _model.userValue),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> buttonUsersRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final buttonUsersRecord =
                                    buttonUsersRecordList.isNotEmpty
                                        ? buttonUsersRecordList.first
                                        : null;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_TASK_COPY_CREATE_TASK_BTN_ON_TAP');
                                    logFirebaseEvent('Button_custom_action');
                                    _model.prodsOblgString =
                                        await actions.listJsonToString(
                                      FFAppState().addTaskProdsOblg.toList(),
                                    );
                                    logFirebaseEvent('Button_custom_action');
                                    _model.prodsGiftsString =
                                        await actions.listJsonToString(
                                      FFAppState().addTaskProdsOblg.toList(),
                                    );
                                    logFirebaseEvent('Button_backend_call');
                                    _model.rAddTask = await TaskAddCall.call(
                                      type: 1,
                                      title: _model.titleTaskController.text,
                                      description:
                                          _model.descriptionController.text,
                                      dateStart: dateTimeFormat(
                                          'd/M/y', _model.datePicked1),
                                      dateEnd: dateTimeFormat(
                                          'd/M/y', _model.datePicked2),
                                      listId: FFAppState().taskDropDownListId,
                                      prodsOblg: functions.boolToIneger(
                                          _model.switchListTileProdsOblgValue),
                                      obj1: double.tryParse(
                                          _model.objectif1Controller.text),
                                      percReal1: double.tryParse(
                                          _model.percReal1Controller.text),
                                      giftMoney1: double.tryParse(
                                          _model.giftMoney1Controller.text),
                                      percGiftMoney1: double.tryParse(
                                          _model.percGiftMoney1Controller.text),
                                      giftChiffre1: double.tryParse(
                                          _model.giftChiffre1Controller.text),
                                      percGiftChiffre1: double.tryParse(_model
                                          .percGiftChiffre1Controller.text),
                                      giftProds1:
                                          FFAppState().addTaskProdsGift.length,
                                      listProdOblgs: _model.prodsOblgString,
                                      listProdGifts: _model.prodsGiftsString,
                                      status: 0,
                                    );
                                    if ((_model.rAddTask?.succeeded ?? true)) {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Add task seccess',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF2ECC71),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            (_model.rAddTask?.jsonBody ?? '')
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor3,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Create Task',
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
