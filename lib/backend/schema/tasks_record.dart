import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasks_record.g.dart';

abstract class TasksRecord implements Built<TasksRecord, TasksRecordBuilder> {
  static Serializer<TasksRecord> get serializer => _$tasksRecordSerializer;

  String? get title;

  String? get description;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: 'updated_by')
  DocumentReference? get updatedBy;

  double? get objectif;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  @BuiltValueField(wireName: 'perc_real')
  double? get percReal;

  @BuiltValueField(wireName: 'gift_money')
  double? get giftMoney;

  @BuiltValueField(wireName: 'ad_user_id')
  DocumentReference? get adUserId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TasksRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..objectif = 0.0
    ..percReal = 0.0
    ..giftMoney = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TasksRecord._();
  factory TasksRecord([void Function(TasksRecordBuilder) updates]) =
      _$TasksRecord;

  static TasksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTasksRecordData({
  String? title,
  String? description,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DateTime? updatedAt,
  DocumentReference? updatedBy,
  double? objectif,
  DateTime? startDate,
  DateTime? endDate,
  double? percReal,
  double? giftMoney,
  DocumentReference? adUserId,
}) {
  final firestoreData = serializers.toFirestore(
    TasksRecord.serializer,
    TasksRecord(
      (t) => t
        ..title = title
        ..description = description
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..updatedAt = updatedAt
        ..updatedBy = updatedBy
        ..objectif = objectif
        ..startDate = startDate
        ..endDate = endDate
        ..percReal = percReal
        ..giftMoney = giftMoney
        ..adUserId = adUserId,
    ),
  );

  return firestoreData;
}
