import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RealisationObjDaysRecord extends FirestoreRecord {
  RealisationObjDaysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "realisation" field.
  double? _realisation;
  double get realisation => _realisation ?? 0.0;
  bool hasRealisation() => _realisation != null;

  void _initializeFields() {
    _day = snapshotData['day'] as DateTime?;
    _realisation = castToType<double>(snapshotData['realisation']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('realisation_obj_days');

  static Stream<RealisationObjDaysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RealisationObjDaysRecord.fromSnapshot(s));

  static Future<RealisationObjDaysRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RealisationObjDaysRecord.fromSnapshot(s));

  static RealisationObjDaysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RealisationObjDaysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RealisationObjDaysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RealisationObjDaysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RealisationObjDaysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RealisationObjDaysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRealisationObjDaysRecordData({
  DateTime? day,
  double? realisation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'realisation': realisation,
    }.withoutNulls,
  );

  return firestoreData;
}

class RealisationObjDaysRecordDocumentEquality
    implements Equality<RealisationObjDaysRecord> {
  const RealisationObjDaysRecordDocumentEquality();

  @override
  bool equals(RealisationObjDaysRecord? e1, RealisationObjDaysRecord? e2) {
    return e1?.day == e2?.day && e1?.realisation == e2?.realisation;
  }

  @override
  int hash(RealisationObjDaysRecord? e) =>
      const ListEquality().hash([e?.day, e?.realisation]);

  @override
  bool isValidKey(Object? o) => o is RealisationObjDaysRecord;
}
