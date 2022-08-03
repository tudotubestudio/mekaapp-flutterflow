import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_types_record.g.dart';

abstract class TaskTypesRecord
    implements Built<TaskTypesRecord, TaskTypesRecordBuilder> {
  static Serializer<TaskTypesRecord> get serializer =>
      _$taskTypesRecordSerializer;

  int? get id;

  String? get name;

  @BuiltValueField(wireName: 'list_permetions')
  BuiltList<DocumentReference>? get listPermetions;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaskTypesRecordBuilder builder) => builder
    ..id = 0
    ..name = ''
    ..listPermetions = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task_types');

  static Stream<TaskTypesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskTypesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaskTypesRecord._();
  factory TaskTypesRecord([void Function(TaskTypesRecordBuilder) updates]) =
      _$TaskTypesRecord;

  static TaskTypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskTypesRecordData({
  int? id,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    TaskTypesRecord.serializer,
    TaskTypesRecord(
      (t) => t
        ..id = id
        ..name = name
        ..listPermetions = null,
    ),
  );

  return firestoreData;
}
