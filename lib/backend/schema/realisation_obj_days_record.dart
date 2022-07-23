import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'realisation_obj_days_record.g.dart';

abstract class RealisationObjDaysRecord
    implements
        Built<RealisationObjDaysRecord, RealisationObjDaysRecordBuilder> {
  static Serializer<RealisationObjDaysRecord> get serializer =>
      _$realisationObjDaysRecordSerializer;

  DateTime? get day;

  double? get realisation;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RealisationObjDaysRecordBuilder builder) =>
      builder..realisation = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('realisation_obj_days');

  static Stream<RealisationObjDaysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RealisationObjDaysRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RealisationObjDaysRecord._();
  factory RealisationObjDaysRecord(
          [void Function(RealisationObjDaysRecordBuilder) updates]) =
      _$RealisationObjDaysRecord;

  static RealisationObjDaysRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRealisationObjDaysRecordData({
  DateTime? day,
  double? realisation,
}) {
  final firestoreData = serializers.toFirestore(
    RealisationObjDaysRecord.serializer,
    RealisationObjDaysRecord(
      (r) => r
        ..day = day
        ..realisation = realisation,
    ),
  );

  return firestoreData;
}
