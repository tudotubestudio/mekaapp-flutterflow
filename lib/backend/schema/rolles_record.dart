import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rolles_record.g.dart';

abstract class RollesRecord
    implements Built<RollesRecord, RollesRecordBuilder> {
  static Serializer<RollesRecord> get serializer => _$rollesRecordSerializer;

  int? get id;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RollesRecordBuilder builder) => builder
    ..id = 0
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rolles');

  static Stream<RollesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RollesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RollesRecord._();
  factory RollesRecord([void Function(RollesRecordBuilder) updates]) =
      _$RollesRecord;

  static RollesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRollesRecordData({
  int? id,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    RollesRecord.serializer,
    RollesRecord(
      (r) => r
        ..id = id
        ..name = name,
    ),
  );

  return firestoreData;
}
