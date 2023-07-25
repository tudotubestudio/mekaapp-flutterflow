// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallLogStruct extends FFFirebaseStruct {
  CallLogStruct({
    String? name,
    String? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _number = number,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;
  bool hasNumber() => _number != null;

  static CallLogStruct fromMap(Map<String, dynamic> data) => CallLogStruct(
        name: data['name'] as String?,
        number: data['number'] as String?,
      );

  static CallLogStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CallLogStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
      }.withoutNulls;

  static CallLogStruct fromSerializableMap(Map<String, dynamic> data) =>
      CallLogStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CallLogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CallLogStruct &&
        name == other.name &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([name, number]);
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
      name: name,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CallLogStruct? updateCallLogStruct(
  CallLogStruct? callLog, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    callLog
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

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
}

Map<String, dynamic> getCallLogFirestoreData(
  CallLogStruct? callLog, [
  bool forFieldValue = false,
]) {
  if (callLog == null) {
    return {};
  }
  final firestoreData = mapToFirestore(callLog.toMap());

  // Add any Firestore field values
  callLog.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallLogListFirestoreData(
  List<CallLogStruct>? callLogs,
) =>
    callLogs?.map((e) => getCallLogFirestoreData(e, true)).toList() ?? [];
