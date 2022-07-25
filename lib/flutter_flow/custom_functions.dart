import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double sumSubTotal(dynamic jsonitem) {
  return jsonitem['data']
      .map((val) => double.parse(val['linenetamt']))
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
  double res = double.parse(num!);
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
  (day1) ? days.add(1) : null;
  (day2) ? days.add(2) : null;
  (day3) ? days.add(3) : null;
  (day4) ? days.add(4) : null;
  (day5) ? days.add(5) : null;
  (day6) ? days.add(6) : null;
  (day7) ? days.add(7) : null;
  return '[${days.map((i) => i.toString()).join(",")}]';
}

int jsonToInt(dynamic item) {
  return int.parse(item);
}

double jsonToDouble(dynamic item) {
  return double.parse(item);
}
