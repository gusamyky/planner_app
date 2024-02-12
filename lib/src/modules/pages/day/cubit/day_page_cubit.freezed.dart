// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayPageState {
  List<Event> get dayEvents => throw _privateConstructorUsedError;
  DbStatus get dbStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Event> dayEvents, DbStatus dbStatus) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Event> dayEvents, DbStatus dbStatus)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Event> dayEvents, DbStatus dbStatus)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayPageStateCopyWith<DayPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayPageStateCopyWith<$Res> {
  factory $DayPageStateCopyWith(
          DayPageState value, $Res Function(DayPageState) then) =
      _$DayPageStateCopyWithImpl<$Res, DayPageState>;
  @useResult
  $Res call({List<Event> dayEvents, DbStatus dbStatus});
}

/// @nodoc
class _$DayPageStateCopyWithImpl<$Res, $Val extends DayPageState>
    implements $DayPageStateCopyWith<$Res> {
  _$DayPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayEvents = null,
    Object? dbStatus = null,
  }) {
    return _then(_value.copyWith(
      dayEvents: null == dayEvents
          ? _value.dayEvents
          : dayEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      dbStatus: null == dbStatus
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DayPageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Event> dayEvents, DbStatus dbStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DayPageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayEvents = null,
    Object? dbStatus = null,
  }) {
    return _then(_$InitialImpl(
      dayEvents: null == dayEvents
          ? _value._dayEvents
          : dayEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      dbStatus: null == dbStatus
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Event> dayEvents = const [], this.dbStatus = DbStatus.init})
      : _dayEvents = dayEvents;

  final List<Event> _dayEvents;
  @override
  @JsonKey()
  List<Event> get dayEvents {
    if (_dayEvents is EqualUnmodifiableListView) return _dayEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayEvents);
  }

  @override
  @JsonKey()
  final DbStatus dbStatus;

  @override
  String toString() {
    return 'DayPageState.initial(dayEvents: $dayEvents, dbStatus: $dbStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._dayEvents, _dayEvents) &&
            (identical(other.dbStatus, dbStatus) ||
                other.dbStatus == dbStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_dayEvents), dbStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Event> dayEvents, DbStatus dbStatus) initial,
  }) {
    return initial(dayEvents, dbStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Event> dayEvents, DbStatus dbStatus)? initial,
  }) {
    return initial?.call(dayEvents, dbStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Event> dayEvents, DbStatus dbStatus)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(dayEvents, dbStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DayPageState {
  const factory _Initial(
      {final List<Event> dayEvents, final DbStatus dbStatus}) = _$InitialImpl;

  @override
  List<Event> get dayEvents;
  @override
  DbStatus get dbStatus;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
