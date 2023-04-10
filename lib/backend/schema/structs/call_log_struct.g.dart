// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CallLogStruct> _$callLogStructSerializer =
    new _$CallLogStructSerializer();

class _$CallLogStructSerializer implements StructuredSerializer<CallLogStruct> {
  @override
  final Iterable<Type> types = const [CallLogStruct, _$CallLogStruct];
  @override
  final String wireName = 'CallLogStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CallLogStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CallLogStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CallLogStructBuilder();

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
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$CallLogStruct extends CallLogStruct {
  @override
  final String? name;
  @override
  final String? number;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CallLogStruct([void Function(CallLogStructBuilder)? updates]) =>
      (new CallLogStructBuilder()..update(updates))._build();

  _$CallLogStruct._({this.name, this.number, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CallLogStruct', 'firestoreUtilData');
  }

  @override
  CallLogStruct rebuild(void Function(CallLogStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CallLogStructBuilder toBuilder() => new CallLogStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CallLogStruct &&
        name == other.name &&
        number == other.number &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CallLogStruct')
          ..add('name', name)
          ..add('number', number)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CallLogStructBuilder
    implements Builder<CallLogStruct, CallLogStructBuilder> {
  _$CallLogStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CallLogStructBuilder() {
    CallLogStruct._initializeBuilder(this);
  }

  CallLogStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _number = $v.number;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CallLogStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CallLogStruct;
  }

  @override
  void update(void Function(CallLogStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CallLogStruct build() => _build();

  _$CallLogStruct _build() {
    final _$result = _$v ??
        new _$CallLogStruct._(
            name: name,
            number: number,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'CallLogStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
