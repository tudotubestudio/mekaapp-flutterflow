import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

double sumSubTotal(dynamic jsonitem) {
  return jsonitem['data']
      .map((val) => double.parse(val['linenetamt']))
      .reduce((value, element) => value + element);
}

double sumSubTotalPrime(
  dynamic jsonitem,
  String? fieldSum,
) {
  return jsonitem
      .map((val) =>
          (val.containsKey(fieldSum)) ? double.parse(val[fieldSum]) : 0)
      .reduce((value, element) => value + element);
}

double percDateProcheOb(
  dynamic jsonitem,
  String? objOp,
  double? percOb,
) {
  // json decode data
  double res = jsonitem['data']
          .map((val) => double.parse(val['linenetamt']))
          .reduce((value, element) => value + element) /
      (double.parse(objOp!) * percOb!);

  return (res > 1) ? 1 : res;
}

double obDateProche1(
  String? objOp,
  double? percOb,
) {
  return double.parse(objOp!) * percOb!;
}

double toDouble(
  String? num,
  bool? progressPerc,
) {
  double res = double.parse(num ?? '0');
  if (progressPerc!) {
    return (res > 1) ? 1 : res;
  } else {
    return res;
  }
}

List<dynamic> searchProductJson(
  dynamic products,
  String? keySearch,
) {
  List<dynamic> listProds = [];
  int i = 0;
  for (Map<String, dynamic> item in products) {
    if (item["name"].contains(keySearch) && i < 10) {
      listProds.add(item);
      i++;
    }
  }
  return listProds;
}

List<dynamic> jsonToListJson(
  dynamic newData,
  List<dynamic> oldData,
) {
  List<dynamic> listProds = [];
  for (Map<String, dynamic> item in newData) {
    listProds.add(item);
  }
  return oldData + listProds;
}

double percTwoNum(
  double? value,
  double? res,
) {
  return value! / res!;
}

double multiplicationTwoNum(
  double? num1,
  double? num2,
) {
  return num1! * num2!;
}

double sumTwoNumCopy(
  double? num1,
  double? num2,
) {
  return num1! + num2!;
}

dynamic addQuantityInJsonProdOblgOrGift(
  dynamic item,
  double? quantity,
) {
  item["quantity"] = quantity;
  return item!;
}

int boolToIneger(bool? status) {
  // Add your function code here!
  if (status!) {
    return 1;
  } else {
    return 0;
  }
}

String createListDaysRepeat(
  bool day1,
  bool day2,
  bool day3,
  bool day4,
  bool day5,
  bool day6,
  bool day7,
) {
  List<int> days = [];
  (day1) ? days.add(7) : null;
  (day2) ? days.add(1) : null;
  (day3) ? days.add(2) : null;
  (day4) ? days.add(3) : null;
  (day5) ? days.add(4) : null;
  (day6) ? days.add(5) : null;
  (day7) ? days.add(6) : null;
  return (days.isNotEmpty)
      ? '[${days.map((i) => i.toString()).join(",")}]'
      : '[]';
}

int jsonToInt(dynamic item) {
  return int.parse(item);
}

double jsonToDouble(dynamic item) {
  return double.parse(item);
}

double percTwoNumMax1(
  double? value,
  double? res,
) {
  if ((value! / res!) <= 1) {
    return value! / res!;
  } else {
    return 1;
  }
}

double jsonToDoublePercMax1(dynamic item) {
  if (double.parse(item) > 1) {
    return 1;
  } else {
    return double.parse(item);
  }
}

DateTime jsonToDate(dynamic item) {
  return DateTime.parse(item);
}

String? getFirstLatter(String? name) {
  return name!.substring(0, 1);
}

DateTime? stringToDate(String date) {
  // string to date
  try {
    return DateTime.parse(date);
  } catch (e) {
    return null;
  }
}

List<double>? getChiffreJson(dynamic data) {
  List<double> listProds = [];
  listProds.add(double.parse(data['ch_0']));
  listProds.add(double.parse(data['ch_1']));
  listProds.add(double.parse(data['ch_2']));
  listProds.add(double.parse(data['ch_3']));
  listProds.add(double.parse(data['ch_4']));
  listProds.add(double.parse(data['ch_5']));
  listProds.add(double.parse(data['ch_6']));
  return listProds;
}

String convertListJsonToString(List<dynamic> data) {
  // json encode
  String jsonString = jsonEncode(data);
  return jsonString;
}

int getIdFromListJson(
  List<dynamic> data,
  String name,
  String namefieldid,
) {
  // get id from list json
  for (var i = 0; i < data.length; i++) {
    if (data[i]['name'] == name) {
      return int.parse(data[i][namefieldid]);
    }
  }
  return 0;
}

DateTime getDateTomorrow() {
  // get Date Tomorrow
  var now = new DateTime.now();
  var tomorrow = new DateTime(now.year, now.month, now.day + 1);
  return tomorrow;
}
