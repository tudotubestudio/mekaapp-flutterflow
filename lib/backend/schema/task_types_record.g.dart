// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_types_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskTypesRecord> _$taskTypesRecordSerializer =
    new _$TaskTypesRecordSerializer();

class _$TaskTypesRecordSerializer
    implements StructuredSerializer<TaskTypesRecord> {
  @override
  final Iterable<Type> types = const [TaskTypesRecord, _$TaskTypesRecord];
  @override
  final String wireName = 'TaskTypesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskTypesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listPermetions;
    if (value != null) {
      result
        ..add('list_permetions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TaskTypesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskTypesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'list_permetions':
          result.listPermetions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TaskTypesRecord extends TaskTypesRecord {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final BuiltList<DocumentReference<Object?>>? listPermetions;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskTypesRecord([void Function(TaskTypesRecordBuilder)? updates]) =>
      (new TaskTypesRecordBuilder()..update(updates))._build();

  _$TaskTypesRecord._({this.id, this.name, this.listPermetions, this.ffRef})
      : super._();

  @override
  TaskTypesRecord rebuild(void Function(TaskTypesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskTypesRecordBuilder toBuilder() =>
      new TaskTypesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskTypesRecord &&
        id == other.id &&
        name == other.name &&
        listPermetions == other.listPermetions &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, listPermetions.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskTypesRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('listPermetions', listPermetions)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskTypesRecordBuilder
    implements Builder<TaskTypesRecord, TaskTypesRecordBuilder> {
  _$TaskTypesRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<DocumentReference<Object?>>? _listPermetions;
  ListBuilder<DocumentReference<Object?>> get listPermetions =>
      _$this._listPermetions ??= new ListBuilder<DocumentReference<Object?>>();
  set listPermetions(ListBuilder<DocumentReference<Object?>>? listPermetions) =>
      _$this._listPermetions = listPermetions;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskTypesRecordBuilder() {
    TaskTypesRecord._initializeBuilder(this);
  }

  TaskTypesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _listPermetions = $v.listPermetions?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskTypesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskTypesRecord;
  }

  @override
  void update(void Function(TaskTypesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskTypesRecord build() => _build();

  _$TaskTypesRecord _build() {
    _$TaskTypesRecord _$result;
    try {
      _$result = _$v ??
          new _$TaskTypesRecord._(
              id: id,
              name: name,
              listPermetions: _listPermetions?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'listPermetions';
        _listPermetions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskTypesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
