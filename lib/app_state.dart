import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _bot =
      FirebaseFirestore.instance.doc('/users/PSCIISz9GzfhpcRESmSuJTXICX92');
  DocumentReference? get bot => _bot;
  set bot(DocumentReference? _value) {
    _bot = _value;
  }

  String _apitoken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2ODA3OTgxMDEsImV4cCI6MTcxMjMzNDEwMSwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.TAqXocvW8ZzlfvrNXsq5tJeLEONPdx45A8CrUORrBYA';
  String get apitoken => _apitoken;
  set apitoken(String _value) {
    _apitoken = _value;
  }

  dynamic _me;
  dynamic get me => _me;
  set me(dynamic _value) {
    _me = _value;
  }

  double _percOb1 = 0.02;
  double get percOb1 => _percOb1;
  set percOb1(double _value) {
    _percOb1 = _value;
  }

  double _percOb2 = 0.07;
  double get percOb2 => _percOb2;
  set percOb2(double _value) {
    _percOb2 = _value;
  }

  double _percOb3 = 0.2;
  double get percOb3 => _percOb3;
  set percOb3(double _value) {
    _percOb3 = _value;
  }

  double _scoreOb1 = 0.05;
  double get scoreOb1 => _scoreOb1;
  set scoreOb1(double _value) {
    _scoreOb1 = _value;
  }

  double _scoreOb2 = 0.2;
  double get scoreOb2 => _scoreOb2;
  set scoreOb2(double _value) {
    _scoreOb2 = _value;
  }

  double _scoreOb3 = 0.5;
  double get scoreOb3 => _scoreOb3;
  set scoreOb3(double _value) {
    _scoreOb3 = _value;
  }

  String _exist = '1';
  String get exist => _exist;
  set exist(String _value) {
    _exist = _value;
  }

  List<dynamic> _addTaskProdsOblg = [];
  List<dynamic> get addTaskProdsOblg => _addTaskProdsOblg;
  set addTaskProdsOblg(List<dynamic> _value) {
    _addTaskProdsOblg = _value;
  }

  void addToAddTaskProdsOblg(dynamic _value) {
    _addTaskProdsOblg.add(_value);
  }

  void removeFromAddTaskProdsOblg(dynamic _value) {
    _addTaskProdsOblg.remove(_value);
  }

  void removeAtIndexFromAddTaskProdsOblg(int _index) {
    _addTaskProdsOblg.removeAt(_index);
  }

  List<dynamic> _addTaskProdsGift = [];
  List<dynamic> get addTaskProdsGift => _addTaskProdsGift;
  set addTaskProdsGift(List<dynamic> _value) {
    _addTaskProdsGift = _value;
  }

  void addToAddTaskProdsGift(dynamic _value) {
    _addTaskProdsGift.add(_value);
  }

  void removeFromAddTaskProdsGift(dynamic _value) {
    _addTaskProdsGift.remove(_value);
  }

  void removeAtIndexFromAddTaskProdsGift(int _index) {
    _addTaskProdsGift.removeAt(_index);
  }

  List<dynamic> _addTaskListProdsSelect = [];
  List<dynamic> get addTaskListProdsSelect => _addTaskListProdsSelect;
  set addTaskListProdsSelect(List<dynamic> _value) {
    _addTaskListProdsSelect = _value;
  }

  void addToAddTaskListProdsSelect(dynamic _value) {
    _addTaskListProdsSelect.add(_value);
  }

  void removeFromAddTaskListProdsSelect(dynamic _value) {
    _addTaskListProdsSelect.remove(_value);
  }

  void removeAtIndexFromAddTaskListProdsSelect(int _index) {
    _addTaskListProdsSelect.removeAt(_index);
  }

  dynamic _taskList;
  dynamic get taskList => _taskList;
  set taskList(dynamic _value) {
    _taskList = _value;
  }

  String _addTaskDateStart = 'Date Start...';
  String get addTaskDateStart => _addTaskDateStart;
  set addTaskDateStart(String _value) {
    _addTaskDateStart = _value;
  }

  String _addTaskDateEnd = 'Date End...';
  String get addTaskDateEnd => _addTaskDateEnd;
  set addTaskDateEnd(String _value) {
    _addTaskDateEnd = _value;
  }

  int _taskDropDownListId = 0;
  int get taskDropDownListId => _taskDropDownListId;
  set taskDropDownListId(int _value) {
    _taskDropDownListId = _value;
  }

  String _taskDropDownListName = 'Select list...';
  String get taskDropDownListName => _taskDropDownListName;
  set taskDropDownListName(String _value) {
    _taskDropDownListName = _value;
  }

  int _taskDropDownUserId = 0;
  int get taskDropDownUserId => _taskDropDownUserId;
  set taskDropDownUserId(int _value) {
    _taskDropDownUserId = _value;
  }

  String _taskDropDownUserName = 'Select user...';
  String get taskDropDownUserName => _taskDropDownUserName;
  set taskDropDownUserName(String _value) {
    _taskDropDownUserName = _value;
  }

  String _addTaskDateYear = 'Date Year...';
  String get addTaskDateYear => _addTaskDateYear;
  set addTaskDateYear(String _value) {
    _addTaskDateYear = _value;
  }

  DocumentReference? _adminId =
      FirebaseFirestore.instance.doc('/users/PSCIISz9GzfhpcRESmSuJTXICX92');
  DocumentReference? get adminId => _adminId;
  set adminId(DocumentReference? _value) {
    _adminId = _value;
  }

  List<int> _xList = [0, 1, 2, 3, 4, 5];
  List<int> get xList => _xList;
  set xList(List<int> _value) {
    _xList = _value;
  }

  void addToXList(int _value) {
    _xList.add(_value);
  }

  void removeFromXList(int _value) {
    _xList.remove(_value);
  }

  void removeAtIndexFromXList(int _index) {
    _xList.removeAt(_index);
  }

  List<String> _yList = ['0', '-1', '-2', '-3', '-4', '-5'];
  List<String> get yList => _yList;
  set yList(List<String> _value) {
    _yList = _value;
  }

  void addToYList(String _value) {
    _yList.add(_value);
  }

  void removeFromYList(String _value) {
    _yList.remove(_value);
  }

  void removeAtIndexFromYList(int _index) {
    _yList.removeAt(_index);
  }

  String _dataString = '';
  String get dataString => _dataString;
  set dataString(String _value) {
    _dataString = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
