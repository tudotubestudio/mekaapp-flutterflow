import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
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

  late SharedPreferences prefs;

  DocumentReference? bot =
      FirebaseFirestore.instance.doc('/users/PSCIISz9GzfhpcRESmSuJTXICX92');

  String apitoken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21la2FhcHAuY29tL2JjZC9iYWNrZW5kL2FwaS9sb2dpbiIsImlhdCI6MTY1ODM2NTA3MywiZXhwIjoxNjYwOTU3MDczLCJuYmYiOjE2NTgzNjUwNzMsImp0aSI6ImZVMk5GTGZKTWFRcFdWV2kiLCJzdWIiOjEwODk4NzAsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.gP-Gyw2_H7rLNfFc0KXLuJVoqL_4ndhcDc0i2P0jl0o';

  dynamic me;

  double percOb1 = 0.02;

  double percOb2 = 0.07;

  double percOb3 = 0.2;

  double scoreOb1 = 0.05;

  double scoreOb2 = 0.2;

  double scoreOb3 = 0.5;

  String exist = '1';

  List<dynamic> addTaskProdsOblg = [];

  List<dynamic> addTaskProdsGift = [];

  List<dynamic> addTaskListProdsSelect = [];

  dynamic taskList;

  String addTaskDateStart = 'Date Start...';

  String addTaskDateEnd = 'Date End...';

  int taskDropDownListId = 0;

  String taskDropDownListName = 'Select list...';
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
