import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'actions_record.g.dart';

abstract class ActionsRecord
    implements Built<ActionsRecord, ActionsRecordBuilder> {
  static Serializer<ActionsRecord> get serializer => _$actionsRecordSerializer;

  String? get name;

  String? get result;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ActionsRecordBuilder builder) => builder
    ..name = ''
    ..result = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actions');

  static Stream<ActionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ActionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ActionsRecord._();
  factory ActionsRecord([void Function(ActionsRecordBuilder) updates]) =
      _$ActionsRecord;

  static ActionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createActionsRecordData({
  String? name,
  String? result,
}) {
  final firestoreData = serializers.toFirestore(
    ActionsRecord.serializer,
    ActionsRecord(
      (a) => a
        ..name = name
        ..result = result,
    ),
  );

  return firestoreData;
}
