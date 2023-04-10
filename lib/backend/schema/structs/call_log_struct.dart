import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'call_log_struct.g.dart';

abstract class CallLogStruct
    implements Built<CallLogStruct, CallLogStructBuilder> {
  static Serializer<CallLogStruct> get serializer => _$callLogStructSerializer;

  String? get name;

  String? get number;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CallLogStructBuilder builder) => builder
    ..name = ''
    ..number = ''
    ..firestoreUtilData = FirestoreUtilData();

  CallLogStruct._();
  factory CallLogStruct([void Function(CallLogStructBuilder) updates]) =
      _$CallLogStruct;
}

CallLogStruct createCallLogStruct({
  String? name,
  String? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CallLogStruct(
      (c) => c
        ..name = name
        ..number = number
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CallLogStruct? updateCallLogStruct(
  CallLogStruct? callLog, {
  bool clearUnsetFields = true,
}) =>
    callLog != null
        ? (callLog.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCallLogStructData(
  Map<String, dynamic> firestoreData,
  CallLogStruct? callLog,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (callLog == null) {
    return;
  }
  if (callLog.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && callLog.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final callLogData = getCallLogFirestoreData(callLog, forFieldValue);
  final nestedData = callLogData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = callLog.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCallLogFirestoreData(
  CallLogStruct? callLog, [
  bool forFieldValue = false,
]) {
  if (callLog == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(CallLogStruct.serializer, callLog);

  // Add any Firestore field values
  callLog.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallLogListFirestoreData(
  List<CallLogStruct>? callLogs,
) =>
    callLogs?.map((c) => getCallLogFirestoreData(c, true)).toList() ?? [];
