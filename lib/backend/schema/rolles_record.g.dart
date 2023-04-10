// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rolles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RollesRecord> _$rollesRecordSerializer =
    new _$RollesRecordSerializer();

class _$RollesRecordSerializer implements StructuredSerializer<RollesRecord> {
  @override
  final Iterable<Type> types = const [RollesRecord, _$RollesRecord];
  @override
  final String wireName = 'RollesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RollesRecord object,
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
  RollesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RollesRecordBuilder();

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

class _$RollesRecord extends RollesRecord {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RollesRecord([void Function(RollesRecordBuilder)? updates]) =>
      (new RollesRecordBuilder()..update(updates))._build();

  _$RollesRecord._({this.id, this.name, this.ffRef}) : super._();

  @override
  RollesRecord rebuild(void Function(RollesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RollesRecordBuilder toBuilder() => new RollesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RollesRecord &&
        id == other.id &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RollesRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RollesRecordBuilder
    implements Builder<RollesRecord, RollesRecordBuilder> {
  _$RollesRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RollesRecordBuilder() {
    RollesRecord._initializeBuilder(this);
  }

  RollesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RollesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RollesRecord;
  }

  @override
  void update(void Function(RollesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RollesRecord build() => _build();

  _$RollesRecord _build() {
    final _$result =
        _$v ?? new _$RollesRecord._(id: id, name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
