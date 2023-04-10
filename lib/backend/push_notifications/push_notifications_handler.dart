import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/292556890_418134813698790_5263401774487634117_n.jpg',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SignUp': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'Boot': ParameterData.none(),
  'List_date_proches_this_week': ParameterData.none(),
  'Log_products_date_proches_this_week': ParameterData.none(),
  'GpsBcd': ParameterData.none(),
  'TrackRealOps': ParameterData.none(),
  'Clients': ParameterData.none(),
  'Client': (data) async => ParameterData(
        allParams: {},
      ),
  'Selles': ParameterData.none(),
  'Offers': ParameterData.none(),
  'Lists': ParameterData.none(),
  'AddOffre': ParameterData.none(),
  'AddListOffre': ParameterData.none(),
  'OrdersOffer': ParameterData.none(),
  'Main': ParameterData.none(),
  'CompareOrderAndOffre': ParameterData.none(),
  'Tasks': ParameterData.none(),
  'addTask': ParameterData.none(),
  'ShowPack': (data) async => ParameterData(
        allParams: {},
      ),
  'addTaskCopy': ParameterData.none(),
  'GetGiftTask': (data) async => ParameterData(
        allParams: {},
      ),
  'MekaApp': ParameterData.none(),
  'ClientsAdmin': ParameterData.none(),
  'ClientsAdminToday': ParameterData.none(),
  'ClientsAdminNoPay': ParameterData.none(),
  'GenerateOrdersMissions': ParameterData.none(),
  'PDFOrdreMission': ParameterData.none(),
  'LogsOrdreMissions': ParameterData.none(),
  'PDFEtatRegionLivreurOrdreMission': (data) async => ParameterData(
        allParams: {},
      ),
  'PDFEtatRegionLivreurOrdreMissionCopy': (data) async => ParameterData(
        allParams: {},
      ),
  'PDFEtatRegionLivreurOrdreMissionCopyCopy': (data) async => ParameterData(
        allParams: {},
      ),
  'TasksAdmin': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
