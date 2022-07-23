import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'gifts_record.g.dart';

abstract class GiftsRecord implements Built<GiftsRecord, GiftsRecordBuilder> {
  static Serializer<GiftsRecord> get serializer => _$giftsRecordSerializer;

  int? get type;

  DocumentReference? get taskId;

  double? get total;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: 'updated_by')
  DocumentReference? get updatedBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GiftsRecordBuilder builder) => builder
    ..type = 0
    ..total = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gifts');

  static Stream<GiftsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GiftsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GiftsRecord._();
  factory GiftsRecord([void Function(GiftsRecordBuilder) updates]) =
      _$GiftsRecord;

  static GiftsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGiftsRecordData({
  int? type,
  DocumentReference? taskId,
  double? total,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DateTime? updatedAt,
  DocumentReference? updatedBy,
}) {
  final firestoreData = serializers.toFirestore(
    GiftsRecord.serializer,
    GiftsRecord(
      (g) => g
        ..type = type
        ..taskId = taskId
        ..total = total
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..updatedAt = updatedAt
        ..updatedBy = updatedBy,
    ),
  );

  return firestoreData;
}
