// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActionsRecord> _$actionsRecordSerializer =
    new _$ActionsRecordSerializer();

class _$ActionsRecordSerializer implements StructuredSerializer<ActionsRecord> {
  @override
  final Iterable<Type> types = const [ActionsRecord, _$ActionsRecord];
  @override
  final String wireName = 'ActionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.result;
    if (value != null) {
      result
        ..add('result')
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
  ActionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'result':
          result.result = serializers.deserialize(value,
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

class _$ActionsRecord extends ActionsRecord {
  @override
  final String? name;
  @override
  final String? result;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActionsRecord([void Function(ActionsRecordBuilder)? updates]) =>
      (new ActionsRecordBuilder()..update(updates))._build();

  _$ActionsRecord._({this.name, this.result, this.ffRef}) : super._();

  @override
  ActionsRecord rebuild(void Function(ActionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActionsRecordBuilder toBuilder() => new ActionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActionsRecord &&
        name == other.name &&
        result == other.result &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActionsRecord')
          ..add('name', name)
          ..add('result', result)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActionsRecordBuilder
    implements Builder<ActionsRecord, ActionsRecordBuilder> {
  _$ActionsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _result;
  String? get result => _$this._result;
  set result(String? result) => _$this._result = result;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActionsRecordBuilder() {
    ActionsRecord._initializeBuilder(this);
  }

  ActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _result = $v.result;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActionsRecord;
  }

  @override
  void update(void Function(ActionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActionsRecord build() => _build();

  _$ActionsRecord _build() {
    final _$result =
        _$v ?? new _$ActionsRecord._(name: name, result: result, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
