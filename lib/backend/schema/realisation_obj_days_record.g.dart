// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realisation_obj_days_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RealisationObjDaysRecord> _$realisationObjDaysRecordSerializer =
    new _$RealisationObjDaysRecordSerializer();

class _$RealisationObjDaysRecordSerializer
    implements StructuredSerializer<RealisationObjDaysRecord> {
  @override
  final Iterable<Type> types = const [
    RealisationObjDaysRecord,
    _$RealisationObjDaysRecord
  ];
  @override
  final String wireName = 'RealisationObjDaysRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RealisationObjDaysRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.realisation;
    if (value != null) {
      result
        ..add('realisation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  RealisationObjDaysRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RealisationObjDaysRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'realisation':
          result.realisation = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$RealisationObjDaysRecord extends RealisationObjDaysRecord {
  @override
  final DateTime? day;
  @override
  final double? realisation;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RealisationObjDaysRecord(
          [void Function(RealisationObjDaysRecordBuilder)? updates]) =>
      (new RealisationObjDaysRecordBuilder()..update(updates)).build();

  _$RealisationObjDaysRecord._({this.day, this.realisation, this.ffRef})
      : super._();

  @override
  RealisationObjDaysRecord rebuild(
          void Function(RealisationObjDaysRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RealisationObjDaysRecordBuilder toBuilder() =>
      new RealisationObjDaysRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RealisationObjDaysRecord &&
        day == other.day &&
        realisation == other.realisation &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, day.hashCode), realisation.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RealisationObjDaysRecord')
          ..add('day', day)
          ..add('realisation', realisation)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RealisationObjDaysRecordBuilder
    implements
        Builder<RealisationObjDaysRecord, RealisationObjDaysRecordBuilder> {
  _$RealisationObjDaysRecord? _$v;

  DateTime? _day;
  DateTime? get day => _$this._day;
  set day(DateTime? day) => _$this._day = day;

  double? _realisation;
  double? get realisation => _$this._realisation;
  set realisation(double? realisation) => _$this._realisation = realisation;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RealisationObjDaysRecordBuilder() {
    RealisationObjDaysRecord._initializeBuilder(this);
  }

  RealisationObjDaysRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _day = $v.day;
      _realisation = $v.realisation;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RealisationObjDaysRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RealisationObjDaysRecord;
  }

  @override
  void update(void Function(RealisationObjDaysRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RealisationObjDaysRecord build() {
    final _$result = _$v ??
        new _$RealisationObjDaysRecord._(
            day: day, realisation: realisation, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
