import '../backend/api_requests/api_calls.dart';
import '../components/create_list_prods_widget.dart';
import '../components/search_prods_gift_widget.dart';
import '../components/select_list_drop_down_widget.dart';
import '../components/select_user_drop_down_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskChiffreWidget extends StatefulWidget {
  const AddTaskChiffreWidget({Key? key}) : super(key: key);

  @override
  _AddTaskChiffreWidgetState createState() => _AddTaskChiffreWidgetState();
}

class _AddTaskChiffreWidgetState extends State<AddTaskChiffreWidget> {
  ApiCallResponse? rAddTask;
  String? prodsGiftsString;
  DateTime? datePicked1;
  String? dropDownTypeTaskValue;
  TextEditingController? titleTaskController;
  TextEditingController? descriptionController;
  DateTime? datePicked2;
  bool? switchListTileListProdsValue;
  DateTime? datePicked3;
  String? dropDownRepeatValue;
  TextEditingController? dayMonthController;
  bool? checkboxDay1Value;
  bool? checkboxDay2Value;
  bool? checkboxDay3Value;
  bool? checkboxDay4Value;
  bool? checkboxDay5Value;
  bool? checkboxDay6Value;
  bool? checkboxDay7Value;
  bool? switchListTileRepeatValue;
  String? radioButtonTypeChiffre1Value;
  TextEditingController? giftChiffre1Controller;
  TextEditingController? percGiftChiffre1Controller;
  String? radioButtonTypeMoney1Value;
  TextEditingController? giftMoney1Controller;
  TextEditingController? percGiftMoney1Controller;
  TextEditingController? objectif1Controller;
  TextEditingController? percReal1Controller;
  bool? switchListTileObj1Value;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dayMonthController = TextEditingController(text: '1');
    descriptionController = TextEditingController();
    titleTaskController = TextEditingController();
    giftChiffre1Controller = TextEditingController(text: '0');
    percGiftChiffre1Controller = TextEditingController(text: '0');
    giftMoney1Controller = TextEditingController(text: '0');
    percGiftMoney1Controller = TextEditingController(text: '0');
    objectif1Controller = TextEditingController();
    percReal1Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
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
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Create Task Chiffre',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF101213),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowDropDown(
                            options: [
                              'Chiffre',
                              'Chiffre Op',
                              'Chiffre Group',
                              'Task',
                              'Déblocage client',
                              'Suivit facts reciption',
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
                            onChanged: (val) =>
                                setState(() => dropDownTypeTaskValue = val),
                            width: 180,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Please select type task...',
                            fillColor: FlutterFlowTheme.of(context).lineColor,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: titleTaskController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter title...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: descriptionController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter description...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).lineColor,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 15, 15, 15),
                                    child: Text(
                                      FFAppState().addTaskDateStart,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.date_range,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    await DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        setState(() => datePicked1 = date);
                                      },
                                      currentTime: getCurrentTimestamp,
                                      minTime: DateTime(0, 0, 0),
                                    );

                                    setState(() => FFAppState()
                                            .addTaskDateStart =
                                        dateTimeFormat('d/M/y', datePicked1));
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
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 15, 15, 15),
                                    child: Text(
                                      FFAppState().addTaskDateEnd,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.date_range,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    await DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        setState(() => datePicked2 = date);
                                      },
                                      currentTime: getCurrentTimestamp,
                                      minTime: DateTime(0, 0, 0),
                                    );

                                    setState(() => FFAppState().addTaskDateEnd =
                                        dateTimeFormat('d/M/y', datePicked2));
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
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: InkWell(
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.75,
                                        child: SelectUserDropDownWidget(),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 15, 15, 15),
                                        child: Text(
                                          FFAppState().taskDropDownUserName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SwitchListTile(
                              value: switchListTileListProdsValue ??= false,
                              onChanged: (newValue) => setState(() =>
                                  switchListTileListProdsValue = newValue),
                              title: Text(
                                'List',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                            if (switchListTileListProdsValue ?? true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.75,
                                                  child:
                                                      SelectListDropDownWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 1,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 15, 15, 15),
                                                  child: Text(
                                                    FFAppState()
                                                        .taskDropDownListName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  size: 30,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child:
                                                      CreateListProdsWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
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
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: SwitchListTile(
                                value: switchListTileRepeatValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => switchListTileRepeatValue = newValue),
                                title: Text(
                                  'Repeat',
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                            if (switchListTileRepeatValue ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: FlutterFlowDropDown(
                                          options: ['Week', 'Month', 'Year'],
                                          onChanged: (val) => setState(
                                              () => dropDownRepeatValue = val),
                                          width: 180,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
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
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                      if ((dropDownRepeatValue == 'Month'))
                                        Expanded(
                                          flex: 1,
                                          child: TextFormField(
                                            controller: dayMonthController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF1F4F8),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 32, 20, 12),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF101213),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((dropDownRepeatValue == 'Week'))
                                        Expanded(
                                          child: Wrap(
                                            spacing: 0,
                                            runSpacing: 0,
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
                                                  value: checkboxDay1Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay1Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Samedi',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                                                  value: checkboxDay2Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay2Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Dimanche ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                                                  value: checkboxDay3Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay3Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Lundi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                                                  value: checkboxDay4Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay4Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Mardi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                                                  value: checkboxDay5Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay5Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Mercredi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                                                  value: checkboxDay6Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay6Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Jeudi ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                                                  value: checkboxDay7Value ??=
                                                      false,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          checkboxDay7Value =
                                                              newValue!),
                                                  title: Text(
                                                    'Vendredi',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
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
                            if ((dropDownRepeatValue == 'Year'))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 15, 15, 15),
                                              child: Text(
                                                FFAppState().addTaskDateYear,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.date_range,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              await DatePicker.showDatePicker(
                                                context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(
                                                      () => datePicked3 = date);
                                                },
                                                currentTime:
                                                    getCurrentTimestamp,
                                                minTime: DateTime(0, 0, 0),
                                              );

                                              setState(() => FFAppState()
                                                      .addTaskDateYear =
                                                  dateTimeFormat(
                                                      'd/M/y', datePicked2));
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SwitchListTile(
                              value: switchListTileObj1Value ??= false,
                              onChanged: (newValue) => setState(
                                  () => switchListTileObj1Value = newValue),
                              title: Text(
                                'Obj 1\n',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                            if (switchListTileObj1Value ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 16),
                                    child: TextFormField(
                                      controller: objectif1Controller,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'objectif1Controller',
                                        Duration(milliseconds: 1000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Objectif (1)...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 32, 20, 12),
                                        suffixIcon:
                                            objectif1Controller!.text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () => setState(
                                                      () => objectif1Controller
                                                          ?.clear(),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF101213),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 16),
                                    child: TextFormField(
                                      controller: percReal1Controller,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'percReal1Controller',
                                        Duration(milliseconds: 1000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Perc (1)...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFF1F4F8),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 32, 20, 12),
                                        suffixIcon:
                                            percReal1Controller!.text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () => setState(
                                                      () => percReal1Controller
                                                          ?.clear(),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF101213),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1, 1, 1, 1),
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
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
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
                                                                .fromSTEB(0, 16,
                                                                    0, 0),
                                                        child:
                                                            FlutterFlowRadioButton(
                                                          options: [
                                                            'Chiffre',
                                                            'Perc'
                                                          ].toList(),
                                                          initialValue:
                                                              'Chiffre',
                                                          onChanged: (value) {
                                                            setState(() =>
                                                                radioButtonTypeMoney1Value =
                                                                    value);
                                                          },
                                                          optionHeight: 25,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
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
                                                      if ((radioButtonTypeMoney1Value ==
                                                          'Chiffre'))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      16,
                                                                      16,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      giftMoney1Controller,
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
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14,
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
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            32,
                                                                            20,
                                                                            12),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                ),
                                                              ),
                                                              Text(
                                                                'DA',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if ((radioButtonTypeMoney1Value ==
                                                          'Perc'))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      16,
                                                                      16,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      percGiftMoney1Controller,
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
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14,
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
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            32,
                                                                            20,
                                                                            12),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                ),
                                                              ),
                                                              Text(
                                                                '%',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
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
                                                                .fromSTEB(0, 16,
                                                                    0, 0),
                                                        child:
                                                            FlutterFlowRadioButton(
                                                          options: [
                                                            'Chiffre',
                                                            'Perc'
                                                          ].toList(),
                                                          initialValue:
                                                              'Chiffre',
                                                          onChanged: (value) {
                                                            setState(() =>
                                                                radioButtonTypeChiffre1Value =
                                                                    value);
                                                          },
                                                          optionHeight: 25,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
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
                                                      if ((radioButtonTypeChiffre1Value ==
                                                          'Chiffre'))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      16,
                                                                      16,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      giftChiffre1Controller,
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
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14,
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
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            32,
                                                                            20,
                                                                            12),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                ),
                                                              ),
                                                              Text(
                                                                'DA',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if ((radioButtonTypeChiffre1Value ==
                                                          'Perc'))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      16,
                                                                      16,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      percGiftChiffre1Controller,
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
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14,
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
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            32,
                                                                            20,
                                                                            12),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                ),
                                                              ),
                                                              Text(
                                                                '%',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
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
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    12,
                                                                borderWidth: 1,
                                                                buttonSize: 50,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: Color(
                                                                      0xFF95A5A6),
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.5,
                                                                          child:
                                                                              SearchProdsGiftWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                prodsGiftItem,
                                                                                r'''$.quantity''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).title2,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  prodsGiftItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).subtitle2.override(
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
                                                                                30,
                                                                            borderWidth:
                                                                                1,
                                                                            buttonSize:
                                                                                60,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.close,
                                                                              color: Color(0xFFE74C3C),
                                                                              size: 20,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() => FFAppState().addTaskProdsGift.remove(prodsGiftItem));
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
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            child: FFButtonWidget(
                              onPressed: () async {
                                prodsGiftsString =
                                    await actions.listJsonToString(
                                  FFAppState().addTaskProdsOblg.toList(),
                                );
                                rAddTask = await TaskAddCall.call(
                                  type: 2,
                                  title: titleTaskController!.text,
                                  description: descriptionController!.text,
                                  dateStart:
                                      dateTimeFormat('d/M/y', datePicked1),
                                  dateEnd: dateTimeFormat('d/M/y', datePicked2),
                                  listId: FFAppState().taskDropDownListId,
                                  obj1: double.parse(objectif1Controller!.text),
                                  percReal1:
                                      double.parse(percReal1Controller!.text),
                                  giftMoney1:
                                      double.parse(giftMoney1Controller!.text),
                                  percGiftMoney1: double.parse(
                                      percGiftMoney1Controller!.text),
                                  giftChiffre1: double.parse(
                                      giftChiffre1Controller!.text),
                                  percGiftChiffre1: double.parse(
                                      percGiftChiffre1Controller!.text),
                                  giftProds1:
                                      FFAppState().addTaskProdsGift.length,
                                  listProdGifts: prodsGiftsString,
                                  status: 1,
                                  forUser: FFAppState().taskDropDownUserId,
                                  repeat: functions
                                      .boolToIneger(switchListTileRepeatValue),
                                  daysWeek: valueOrDefault<String>(
                                    functions.createListDaysRepeat(
                                        checkboxDay1Value!,
                                        checkboxDay2Value!,
                                        checkboxDay3Value!,
                                        checkboxDay4Value!,
                                        checkboxDay5Value!,
                                        checkboxDay6Value!,
                                        checkboxDay7Value!),
                                    '[]',
                                  ),
                                  dayMonth: int.parse(dayMonthController!.text),
                                  dayYear: dateTimeFormat('d/M/y', datePicked2),
                                );
                                if ((rAddTask?.succeeded ?? true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Add task seccess',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xFF2ECC71),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        (rAddTask?.jsonBody ?? ''),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
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
                                width: 270,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
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
