import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RollesRecord extends FirestoreRecord {
  RollesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rolles');

  static Stream<RollesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RollesRecord.fromSnapshot(s));

  static Future<RollesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RollesRecord.fromSnapshot(s));

  static RollesRecord fromSnapshot(DocumentSnapshot snapshot) => RollesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RollesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RollesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RollesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RollesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRollesRecordData({
  int? id,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class RollesRecordDocumentEquality implements Equality<RollesRecord> {
  const RollesRecordDocumentEquality();

  @override
  bool equals(RollesRecord? e1, RollesRecord? e2) {
    return e1?.id == e2?.id && e1?.name == e2?.name;
  }

  @override
  int hash(RollesRecord? e) => const ListEquality().hash([e?.id, e?.name]);

  @override
  bool isValidKey(Object? o) => o is RollesRecord;
}
