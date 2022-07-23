import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'conversations_record.g.dart';

abstract class ConversationsRecord
    implements Built<ConversationsRecord, ConversationsRecordBuilder> {
  static Serializer<ConversationsRecord> get serializer =>
      _$conversationsRecordSerializer;

  String? get type;

  String? get result;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConversationsRecordBuilder builder) => builder
    ..type = ''
    ..result = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConversationsRecord._();
  factory ConversationsRecord(
          [void Function(ConversationsRecordBuilder) updates]) =
      _$ConversationsRecord;

  static ConversationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConversationsRecordData({
  String? type,
  String? result,
  DateTime? createdAt,
  DocumentReference? createdBy,
}) {
  final firestoreData = serializers.toFirestore(
    ConversationsRecord.serializer,
    ConversationsRecord(
      (c) => c
        ..type = type
        ..result = result
        ..createdAt = createdAt
        ..createdBy = createdBy,
    ),
  );

  return firestoreData;
}
