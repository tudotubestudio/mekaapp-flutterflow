import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_type_test_struct.g.dart';

abstract class DataTypeTestStruct
    implements Built<DataTypeTestStruct, DataTypeTestStructBuilder> {
  static Serializer<DataTypeTestStruct> get serializer =>
      _$dataTypeTestStructSerializer;

  String? get name;

  int? get id;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DataTypeTestStructBuilder builder) => builder
    ..name = ''
    ..id = 0
    ..firestoreUtilData = FirestoreUtilData();

  DataTypeTestStruct._();
  factory DataTypeTestStruct(
          [void Function(DataTypeTestStructBuilder) updates]) =
      _$DataTypeTestStruct;
}

DataTypeTestStruct createDataTypeTestStruct({
  String? name,
  int? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataTypeTestStruct(
      (d) => d
        ..name = name
        ..id = id
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DataTypeTestStruct? updateDataTypeTestStruct(
  DataTypeTestStruct? dataTypeTest, {
  bool clearUnsetFields = true,
}) =>
    dataTypeTest != null
        ? (dataTypeTest.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDataTypeTestStructData(
  Map<String, dynamic> firestoreData,
  DataTypeTestStruct? dataTypeTest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataTypeTest == null) {
    return;
  }
  if (dataTypeTest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && dataTypeTest.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = {};
  }
  final dataTypeTestData =
      getDataTypeTestFirestoreData(dataTypeTest, forFieldValue);
  final nestedData =
      dataTypeTestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = dataTypeTest.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDataTypeTestFirestoreData(
  DataTypeTestStruct? dataTypeTest, [
  bool forFieldValue = false,
]) {
  if (dataTypeTest == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DataTypeTestStruct.serializer, dataTypeTest);

  // Add any Firestore field values
  dataTypeTest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataTypeTestListFirestoreData(
  List<DataTypeTestStruct>? dataTypeTests,
) =>
    dataTypeTests?.map((d) => getDataTypeTestFirestoreData(d, true)).toList() ??
    [];
