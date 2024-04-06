// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_events_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllEventsState {
  List<Event> get allEvents => throw _privateConstructorUsedError;
  DbStatus get dbStatus => throw _privateConstructorUsedError;
  List<Event> get foundEvents => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents)?
        initial,
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
  $AllEventsStateCopyWith<AllEventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllEventsStateCopyWith<$Res> {
  factory $AllEventsStateCopyWith(
          AllEventsState value, $Res Function(AllEventsState) then) =
      _$AllEventsStateCopyWithImpl<$Res, AllEventsState>;
  @useResult
  $Res call(
      {List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents});
}

/// @nodoc
class _$AllEventsStateCopyWithImpl<$Res, $Val extends AllEventsState>
    implements $AllEventsStateCopyWith<$Res> {
  _$AllEventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allEvents = null,
    Object? dbStatus = null,
    Object? foundEvents = null,
  }) {
    return _then(_value.copyWith(
      allEvents: null == allEvents
          ? _value.allEvents
          : allEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      dbStatus: null == dbStatus
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus,
      foundEvents: null == foundEvents
          ? _value.foundEvents
          : foundEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AllEventsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AllEventsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allEvents = null,
    Object? dbStatus = null,
    Object? foundEvents = null,
  }) {
    return _then(_$InitialImpl(
      allEvents: null == allEvents
          ? _value._allEvents
          : allEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      dbStatus: null == dbStatus
          ? _value.dbStatus
          : dbStatus // ignore: cast_nullable_to_non_nullable
              as DbStatus,
      foundEvents: null == foundEvents
          ? _value._foundEvents
          : foundEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Event> allEvents = const [],
      this.dbStatus = DbStatus.init,
      final List<Event> foundEvents = const []})
      : _allEvents = allEvents,
        _foundEvents = foundEvents;

  final List<Event> _allEvents;
  @override
  @JsonKey()
  List<Event> get allEvents {
    if (_allEvents is EqualUnmodifiableListView) return _allEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allEvents);
  }

  @override
  @JsonKey()
  final DbStatus dbStatus;
  final List<Event> _foundEvents;
  @override
  @JsonKey()
  List<Event> get foundEvents {
    if (_foundEvents is EqualUnmodifiableListView) return _foundEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foundEvents);
  }

  @override
  String toString() {
    return 'AllEventsState.initial(allEvents: $allEvents, dbStatus: $dbStatus, foundEvents: $foundEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._allEvents, _allEvents) &&
            (identical(other.dbStatus, dbStatus) ||
                other.dbStatus == dbStatus) &&
            const DeepCollectionEquality()
                .equals(other._foundEvents, _foundEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allEvents),
      dbStatus,
      const DeepCollectionEquality().hash(_foundEvents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents)
        initial,
  }) {
    return initial(allEvents, dbStatus, foundEvents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents)?
        initial,
  }) {
    return initial?.call(allEvents, dbStatus, foundEvents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Event> allEvents, DbStatus dbStatus, List<Event> foundEvents)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(allEvents, dbStatus, foundEvents);
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

abstract class _Initial implements AllEventsState {
  const factory _Initial(
      {final List<Event> allEvents,
      final DbStatus dbStatus,
      final List<Event> foundEvents}) = _$InitialImpl;

  @override
  List<Event> get allEvents;
  @override
  DbStatus get dbStatus;
  @override
  List<Event> get foundEvents;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
