import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskTypesRecord extends FirestoreRecord {
  TaskTypesRecord._(
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

  // "list_permetions" field.
  List<DocumentReference>? _listPermetions;
  List<DocumentReference> get listPermetions => _listPermetions ?? const [];
  bool hasListPermetions() => _listPermetions != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['name'] as String?;
    _listPermetions = getDataList(snapshotData['list_permetions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task_types');

  static Stream<TaskTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskTypesRecord.fromSnapshot(s));

  static Future<TaskTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskTypesRecord.fromSnapshot(s));

  static TaskTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaskTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskTypesRecordData({
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

class TaskTypesRecordDocumentEquality implements Equality<TaskTypesRecord> {
  const TaskTypesRecordDocumentEquality();

  @override
  bool equals(TaskTypesRecord? e1, TaskTypesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.listPermetions, e2?.listPermetions);
  }

  @override
  int hash(TaskTypesRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.listPermetions]);

  @override
  bool isValidKey(Object? o) => o is TaskTypesRecord;
}
