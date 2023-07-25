import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionsRecord extends FirestoreRecord {
  ActionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _result = snapshotData['result'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actions');

  static Stream<ActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActionsRecord.fromSnapshot(s));

  static Future<ActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActionsRecord.fromSnapshot(s));

  static ActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActionsRecordData({
  String? name,
  String? result,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'result': result,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActionsRecordDocumentEquality implements Equality<ActionsRecord> {
  const ActionsRecordDocumentEquality();

  @override
  bool equals(ActionsRecord? e1, ActionsRecord? e2) {
    return e1?.name == e2?.name && e1?.result == e2?.result;
  }

  @override
  int hash(ActionsRecord? e) => const ListEquality().hash([e?.name, e?.result]);

  @override
  bool isValidKey(Object? o) => o is ActionsRecord;
}
