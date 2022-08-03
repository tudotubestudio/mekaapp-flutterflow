// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GiftsRecord> _$giftsRecordSerializer = new _$GiftsRecordSerializer();

class _$GiftsRecordSerializer implements StructuredSerializer<GiftsRecord> {
  @override
  final Iterable<Type> types = const [GiftsRecord, _$GiftsRecord];
  @override
  final String wireName = 'GiftsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GiftsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.taskId;
    if (value != null) {
      result
        ..add('taskId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedBy;
    if (value != null) {
      result
        ..add('updated_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  GiftsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GiftsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'taskId':
          result.taskId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_by':
          result.updatedBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$GiftsRecord extends GiftsRecord {
  @override
  final int? type;
  @override
  final DocumentReference<Object?>? taskId;
  @override
  final double? total;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? updatedAt;
  @override
  final DocumentReference<Object?>? updatedBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GiftsRecord([void Function(GiftsRecordBuilder)? updates]) =>
      (new GiftsRecordBuilder()..update(updates))._build();

  _$GiftsRecord._(
      {this.type,
      this.taskId,
      this.total,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.ffRef})
      : super._();

  @override
  GiftsRecord rebuild(void Function(GiftsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiftsRecordBuilder toBuilder() => new GiftsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiftsRecord &&
        type == other.type &&
        taskId == other.taskId &&
        total == other.total &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        updatedAt == other.updatedAt &&
        updatedBy == other.updatedBy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, type.hashCode), taskId.hashCode),
                            total.hashCode),
                        createdAt.hashCode),
                    createdBy.hashCode),
                updatedAt.hashCode),
            updatedBy.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiftsRecord')
          ..add('type', type)
          ..add('taskId', taskId)
          ..add('total', total)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('updatedAt', updatedAt)
          ..add('updatedBy', updatedBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GiftsRecordBuilder implements Builder<GiftsRecord, GiftsRecordBuilder> {
  _$GiftsRecord? _$v;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  DocumentReference<Object?>? _taskId;
  DocumentReference<Object?>? get taskId => _$this._taskId;
  set taskId(DocumentReference<Object?>? taskId) => _$this._taskId = taskId;

  double? _total;
  double? get total => _$this._total;
  set total(double? total) => _$this._total = total;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DocumentReference<Object?>? _updatedBy;
  DocumentReference<Object?>? get updatedBy => _$this._updatedBy;
  set updatedBy(DocumentReference<Object?>? updatedBy) =>
      _$this._updatedBy = updatedBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GiftsRecordBuilder() {
    GiftsRecord._initializeBuilder(this);
  }

  GiftsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _taskId = $v.taskId;
      _total = $v.total;
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _updatedAt = $v.updatedAt;
      _updatedBy = $v.updatedBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiftsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiftsRecord;
  }

  @override
  void update(void Function(GiftsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiftsRecord build() => _build();

  _$GiftsRecord _build() {
    final _$result = _$v ??
        new _$GiftsRecord._(
            type: type,
            taskId: taskId,
            total: total,
            createdAt: createdAt,
            createdBy: createdBy,
            updatedAt: updatedAt,
            updatedBy: updatedBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
