import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GiftsRecord extends FirestoreRecord {
  GiftsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "taskId" field.
  DocumentReference? _taskId;
  DocumentReference? get taskId => _taskId;
  bool hasTaskId() => _taskId != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "updated_by" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  void _initializeFields() {
    _type = castToType<int>(snapshotData['type']);
    _taskId = snapshotData['taskId'] as DocumentReference?;
    _total = castToType<double>(snapshotData['total']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _updatedBy = snapshotData['updated_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gifts');

  static Stream<GiftsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GiftsRecord.fromSnapshot(s));

  static Future<GiftsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GiftsRecord.fromSnapshot(s));

  static GiftsRecord fromSnapshot(DocumentSnapshot snapshot) => GiftsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GiftsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GiftsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GiftsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GiftsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'taskId': taskId,
      'total': total,
      'created_at': createdAt,
      'created_by': createdBy,
      'updated_at': updatedAt,
      'updated_by': updatedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class GiftsRecordDocumentEquality implements Equality<GiftsRecord> {
  const GiftsRecordDocumentEquality();

  @override
  bool equals(GiftsRecord? e1, GiftsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.taskId == e2?.taskId &&
        e1?.total == e2?.total &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.updatedBy == e2?.updatedBy;
  }

  @override
  int hash(GiftsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.taskId,
        e?.total,
        e?.createdAt,
        e?.createdBy,
        e?.updatedAt,
        e?.updatedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is GiftsRecord;
}
