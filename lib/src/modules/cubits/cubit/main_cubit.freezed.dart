// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  bool get isSearchActive => throw _privateConstructorUsedError;
  List<Event> get allEvents => throw _privateConstructorUsedError;
  List<Event> get foundEvents => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSearchActive, List<Event> allEvents,
            List<Event> foundEvents, StateStatus stateStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSearchActive, List<Event> allEvents,
            List<Event> foundEvents, StateStatus stateStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSearchActive, List<Event> allEvents,
            List<Event> foundEvents, StateStatus stateStatus)?
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
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {bool isSearchActive,
      List<Event> allEvents,
      List<Event> foundEvents,
      StateStatus stateStatus});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchActive = null,
    Object? allEvents = null,
    Object? foundEvents = null,
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      isSearchActive: null == isSearchActive
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
      allEvents: null == allEvents
          ? _value.allEvents
          : allEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      foundEvents: null == foundEvents
          ? _value.foundEvents
          : foundEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearchActive,
      List<Event> allEvents,
      List<Event> foundEvents,
      StateStatus stateStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchActive = null,
    Object? allEvents = null,
    Object? foundEvents = null,
    Object? stateStatus = null,
  }) {
    return _then(_$InitialImpl(
      isSearchActive: null == isSearchActive
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
      allEvents: null == allEvents
          ? _value._allEvents
          : allEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      foundEvents: null == foundEvents
          ? _value._foundEvents
          : foundEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isSearchActive = false,
      final List<Event> allEvents = const [],
      final List<Event> foundEvents = const [],
      this.stateStatus = StateStatus.init})
      : _allEvents = allEvents,
        _foundEvents = foundEvents;

  @override
  @JsonKey()
  final bool isSearchActive;
  final List<Event> _allEvents;
  @override
  @JsonKey()
  List<Event> get allEvents {
    if (_allEvents is EqualUnmodifiableListView) return _allEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allEvents);
  }

  final List<Event> _foundEvents;
  @override
  @JsonKey()
  List<Event> get foundEvents {
    if (_foundEvents is EqualUnmodifiableListView) return _foundEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foundEvents);
  }

  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'MainState.initial(isSearchActive: $isSearchActive, allEvents: $allEvents, foundEvents: $foundEvents, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isSearchActive, isSearchActive) ||
                other.isSearchActive == isSearchActive) &&
            const DeepCollectionEquality()
                .equals(other._allEvents, _allEvents) &&
            const DeepCollectionEquality()
                .equals(other._foundEvents, _foundEvents) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearchActive,
      const DeepCollectionEquality().hash(_allEvents),
      const DeepCollectionEquality().hash(_foundEvents),
      stateStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSearchActive, List<Event> allEvents,
            List<Event> foundEvents, StateStatus stateStatus)
        initial,
  }) {
    return initial(isSearchActive, allEvents, foundEvents, stateStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSearchActive, List<Event> allEvents,
            List<Event> foundEvents, StateStatus stateStatus)?
        initial,
  }) {
    return initial?.call(isSearchActive, allEvents, foundEvents, stateStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSearchActive, List<Event> allEvents,
            List<Event> foundEvents, StateStatus stateStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isSearchActive, allEvents, foundEvents, stateStatus);
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

abstract class _Initial implements MainState {
  const factory _Initial(
      {final bool isSearchActive,
      final List<Event> allEvents,
      final List<Event> foundEvents,
      final StateStatus stateStatus}) = _$InitialImpl;

  @override
  bool get isSearchActive;
  @override
  List<Event> get allEvents;
  @override
  List<Event> get foundEvents;
  @override
  StateStatus get stateStatus;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
