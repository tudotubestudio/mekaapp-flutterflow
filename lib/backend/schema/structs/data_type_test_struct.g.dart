// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_type_test_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataTypeTestStruct> _$dataTypeTestStructSerializer =
    new _$DataTypeTestStructSerializer();

class _$DataTypeTestStructSerializer
    implements StructuredSerializer<DataTypeTestStruct> {
  @override
  final Iterable<Type> types = const [DataTypeTestStruct, _$DataTypeTestStruct];
  @override
  final String wireName = 'DataTypeTestStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DataTypeTestStruct object,
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  DataTypeTestStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataTypeTestStructBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$DataTypeTestStruct extends DataTypeTestStruct {
  @override
  final String? name;
  @override
  final int? id;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DataTypeTestStruct(
          [void Function(DataTypeTestStructBuilder)? updates]) =>
      (new DataTypeTestStructBuilder()..update(updates))._build();

  _$DataTypeTestStruct._({this.name, this.id, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DataTypeTestStruct', 'firestoreUtilData');
  }

  @override
  DataTypeTestStruct rebuild(
          void Function(DataTypeTestStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataTypeTestStructBuilder toBuilder() =>
      new DataTypeTestStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataTypeTestStruct &&
        name == other.name &&
        id == other.id &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, name.hashCode), id.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataTypeTestStruct')
          ..add('name', name)
          ..add('id', id)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DataTypeTestStructBuilder
    implements Builder<DataTypeTestStruct, DataTypeTestStructBuilder> {
  _$DataTypeTestStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DataTypeTestStructBuilder() {
    DataTypeTestStruct._initializeBuilder(this);
  }

  DataTypeTestStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _id = $v.id;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataTypeTestStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataTypeTestStruct;
  }

  @override
  void update(void Function(DataTypeTestStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataTypeTestStruct build() => _build();

  _$DataTypeTestStruct _build() {
    final _$result = _$v ??
        new _$DataTypeTestStruct._(
            name: name,
            id: id,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DataTypeTestStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
