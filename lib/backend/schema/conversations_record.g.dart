// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversationsRecord> _$conversationsRecordSerializer =
    new _$ConversationsRecordSerializer();

class _$ConversationsRecordSerializer
    implements StructuredSerializer<ConversationsRecord> {
  @override
  final Iterable<Type> types = const [
    ConversationsRecord,
    _$ConversationsRecord
  ];
  @override
  final String wireName = 'ConversationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConversationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  ConversationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'result':
          result.result = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$ConversationsRecord extends ConversationsRecord {
  @override
  final String? type;
  @override
  final String? result;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConversationsRecord(
          [void Function(ConversationsRecordBuilder)? updates]) =>
      (new ConversationsRecordBuilder()..update(updates))._build();

  _$ConversationsRecord._(
      {this.type, this.result, this.createdAt, this.createdBy, this.ffRef})
      : super._();

  @override
  ConversationsRecord rebuild(
          void Function(ConversationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationsRecordBuilder toBuilder() =>
      new ConversationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationsRecord &&
        type == other.type &&
        result == other.result &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, type.hashCode), result.hashCode),
                createdAt.hashCode),
            createdBy.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationsRecord')
          ..add('type', type)
          ..add('result', result)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConversationsRecordBuilder
    implements Builder<ConversationsRecord, ConversationsRecordBuilder> {
  _$ConversationsRecord? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _result;
  String? get result => _$this._result;
  set result(String? result) => _$this._result = result;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConversationsRecordBuilder() {
    ConversationsRecord._initializeBuilder(this);
  }

  ConversationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _result = $v.result;
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConversationsRecord;
  }

  @override
  void update(void Function(ConversationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationsRecord build() => _build();

  _$ConversationsRecord _build() {
    final _$result = _$v ??
        new _$ConversationsRecord._(
            type: type,
            result: result,
            createdAt: createdAt,
            createdBy: createdBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
