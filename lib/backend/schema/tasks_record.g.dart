// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TasksRecord> _$tasksRecordSerializer = new _$TasksRecordSerializer();

class _$TasksRecordSerializer implements StructuredSerializer<TasksRecord> {
  @override
  final Iterable<Type> types = const [TasksRecord, _$TasksRecord];
  @override
  final String wireName = 'TasksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TasksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
    value = object.objectif;
    if (value != null) {
      result
        ..add('objectif')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.percReal;
    if (value != null) {
      result
        ..add('perc_real')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.giftMoney;
    if (value != null) {
      result
        ..add('gift_money')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.adUserId;
    if (value != null) {
      result
        ..add('ad_user_id')
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
  TasksRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TasksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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
        case 'objectif':
          result.objectif = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'perc_real':
          result.percReal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'gift_money':
          result.giftMoney = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ad_user_id':
          result.adUserId = serializers.deserialize(value,
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

class _$TasksRecord extends TasksRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? updatedAt;
  @override
  final DocumentReference<Object?>? updatedBy;
  @override
  final double? objectif;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? percReal;
  @override
  final double? giftMoney;
  @override
  final DocumentReference<Object?>? adUserId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TasksRecord([void Function(TasksRecordBuilder)? updates]) =>
      (new TasksRecordBuilder()..update(updates)).build();

  _$TasksRecord._(
      {this.title,
      this.description,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.objectif,
      this.startDate,
      this.endDate,
      this.percReal,
      this.giftMoney,
      this.adUserId,
      this.ffRef})
      : super._();

  @override
  TasksRecord rebuild(void Function(TasksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRecordBuilder toBuilder() => new TasksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRecord &&
        title == other.title &&
        description == other.description &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        updatedAt == other.updatedAt &&
        updatedBy == other.updatedBy &&
        objectif == other.objectif &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        percReal == other.percReal &&
        giftMoney == other.giftMoney &&
        adUserId == other.adUserId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, title.hashCode),
                                                    description.hashCode),
                                                createdAt.hashCode),
                                            createdBy.hashCode),
                                        updatedAt.hashCode),
                                    updatedBy.hashCode),
                                objectif.hashCode),
                            startDate.hashCode),
                        endDate.hashCode),
                    percReal.hashCode),
                giftMoney.hashCode),
            adUserId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TasksRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('updatedAt', updatedAt)
          ..add('updatedBy', updatedBy)
          ..add('objectif', objectif)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('percReal', percReal)
          ..add('giftMoney', giftMoney)
          ..add('adUserId', adUserId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TasksRecordBuilder implements Builder<TasksRecord, TasksRecordBuilder> {
  _$TasksRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

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

  double? _objectif;
  double? get objectif => _$this._objectif;
  set objectif(double? objectif) => _$this._objectif = objectif;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  double? _percReal;
  double? get percReal => _$this._percReal;
  set percReal(double? percReal) => _$this._percReal = percReal;

  double? _giftMoney;
  double? get giftMoney => _$this._giftMoney;
  set giftMoney(double? giftMoney) => _$this._giftMoney = giftMoney;

  DocumentReference<Object?>? _adUserId;
  DocumentReference<Object?>? get adUserId => _$this._adUserId;
  set adUserId(DocumentReference<Object?>? adUserId) =>
      _$this._adUserId = adUserId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TasksRecordBuilder() {
    TasksRecord._initializeBuilder(this);
  }

  TasksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _updatedAt = $v.updatedAt;
      _updatedBy = $v.updatedBy;
      _objectif = $v.objectif;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _percReal = $v.percReal;
      _giftMoney = $v.giftMoney;
      _adUserId = $v.adUserId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRecord;
  }

  @override
  void update(void Function(TasksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TasksRecord build() {
    final _$result = _$v ??
        new _$TasksRecord._(
            title: title,
            description: description,
            createdAt: createdAt,
            createdBy: createdBy,
            updatedAt: updatedAt,
            updatedBy: updatedBy,
            objectif: objectif,
            startDate: startDate,
            endDate: endDate,
            percReal: percReal,
            giftMoney: giftMoney,
            adUserId: adUserId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
