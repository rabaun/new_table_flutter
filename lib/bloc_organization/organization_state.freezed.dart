// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrganizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrganizationModel>? organizationList) data,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrganizationModel>? organizationList)? data,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrganizationModel>? organizationList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaOrganizationState value) initial,
    required TResult Function(LoadingOrganizationState value) loading,
    required TResult Function(DataOrganizationState value) data,
    required TResult Function(OrganizationError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaOrganizationState value)? initial,
    TResult? Function(LoadingOrganizationState value)? loading,
    TResult? Function(DataOrganizationState value)? data,
    TResult? Function(OrganizationError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaOrganizationState value)? initial,
    TResult Function(LoadingOrganizationState value)? loading,
    TResult Function(DataOrganizationState value)? data,
    TResult Function(OrganizationError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationStateCopyWith<$Res> {
  factory $OrganizationStateCopyWith(
          OrganizationState value, $Res Function(OrganizationState) then) =
      _$OrganizationStateCopyWithImpl<$Res, OrganizationState>;
}

/// @nodoc
class _$OrganizationStateCopyWithImpl<$Res, $Val extends OrganizationState>
    implements $OrganizationStateCopyWith<$Res> {
  _$OrganizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitiaOrganizationStateImplCopyWith<$Res> {
  factory _$$InitiaOrganizationStateImplCopyWith(
          _$InitiaOrganizationStateImpl value,
          $Res Function(_$InitiaOrganizationStateImpl) then) =
      __$$InitiaOrganizationStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitiaOrganizationStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$InitiaOrganizationStateImpl>
    implements _$$InitiaOrganizationStateImplCopyWith<$Res> {
  __$$InitiaOrganizationStateImplCopyWithImpl(
      _$InitiaOrganizationStateImpl _value,
      $Res Function(_$InitiaOrganizationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitiaOrganizationStateImpl implements _InitiaOrganizationState {
  const _$InitiaOrganizationStateImpl();

  @override
  String toString() {
    return 'OrganizationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiaOrganizationStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrganizationModel>? organizationList) data,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrganizationModel>? organizationList)? data,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrganizationModel>? organizationList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaOrganizationState value) initial,
    required TResult Function(LoadingOrganizationState value) loading,
    required TResult Function(DataOrganizationState value) data,
    required TResult Function(OrganizationError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaOrganizationState value)? initial,
    TResult? Function(LoadingOrganizationState value)? loading,
    TResult? Function(DataOrganizationState value)? data,
    TResult? Function(OrganizationError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaOrganizationState value)? initial,
    TResult Function(LoadingOrganizationState value)? loading,
    TResult Function(DataOrganizationState value)? data,
    TResult Function(OrganizationError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitiaOrganizationState implements OrganizationState {
  const factory _InitiaOrganizationState() = _$InitiaOrganizationStateImpl;
}

/// @nodoc
abstract class _$$LoadingOrganizationStateImplCopyWith<$Res> {
  factory _$$LoadingOrganizationStateImplCopyWith(
          _$LoadingOrganizationStateImpl value,
          $Res Function(_$LoadingOrganizationStateImpl) then) =
      __$$LoadingOrganizationStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingOrganizationStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res,
        _$LoadingOrganizationStateImpl>
    implements _$$LoadingOrganizationStateImplCopyWith<$Res> {
  __$$LoadingOrganizationStateImplCopyWithImpl(
      _$LoadingOrganizationStateImpl _value,
      $Res Function(_$LoadingOrganizationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingOrganizationStateImpl implements LoadingOrganizationState {
  const _$LoadingOrganizationStateImpl();

  @override
  String toString() {
    return 'OrganizationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingOrganizationStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrganizationModel>? organizationList) data,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrganizationModel>? organizationList)? data,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrganizationModel>? organizationList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaOrganizationState value) initial,
    required TResult Function(LoadingOrganizationState value) loading,
    required TResult Function(DataOrganizationState value) data,
    required TResult Function(OrganizationError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaOrganizationState value)? initial,
    TResult? Function(LoadingOrganizationState value)? loading,
    TResult? Function(DataOrganizationState value)? data,
    TResult? Function(OrganizationError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaOrganizationState value)? initial,
    TResult Function(LoadingOrganizationState value)? loading,
    TResult Function(DataOrganizationState value)? data,
    TResult Function(OrganizationError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingOrganizationState implements OrganizationState {
  const factory LoadingOrganizationState() = _$LoadingOrganizationStateImpl;
}

/// @nodoc
abstract class _$$DataOrganizationStateImplCopyWith<$Res> {
  factory _$$DataOrganizationStateImplCopyWith(
          _$DataOrganizationStateImpl value,
          $Res Function(_$DataOrganizationStateImpl) then) =
      __$$DataOrganizationStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrganizationModel>? organizationList});
}

/// @nodoc
class __$$DataOrganizationStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$DataOrganizationStateImpl>
    implements _$$DataOrganizationStateImplCopyWith<$Res> {
  __$$DataOrganizationStateImplCopyWithImpl(_$DataOrganizationStateImpl _value,
      $Res Function(_$DataOrganizationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationList = freezed,
  }) {
    return _then(_$DataOrganizationStateImpl(
      organizationList: freezed == organizationList
          ? _value._organizationList
          : organizationList // ignore: cast_nullable_to_non_nullable
              as List<OrganizationModel>?,
    ));
  }
}

/// @nodoc

class _$DataOrganizationStateImpl implements DataOrganizationState {
  const _$DataOrganizationStateImpl(
      {required final List<OrganizationModel>? organizationList})
      : _organizationList = organizationList;

  final List<OrganizationModel>? _organizationList;
  @override
  List<OrganizationModel>? get organizationList {
    final value = _organizationList;
    if (value == null) return null;
    if (_organizationList is EqualUnmodifiableListView)
      return _organizationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrganizationState.data(organizationList: $organizationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOrganizationStateImpl &&
            const DeepCollectionEquality()
                .equals(other._organizationList, _organizationList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_organizationList));

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOrganizationStateImplCopyWith<_$DataOrganizationStateImpl>
      get copyWith => __$$DataOrganizationStateImplCopyWithImpl<
          _$DataOrganizationStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrganizationModel>? organizationList) data,
    required TResult Function(String error) error,
  }) {
    return data(organizationList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrganizationModel>? organizationList)? data,
    TResult? Function(String error)? error,
  }) {
    return data?.call(organizationList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrganizationModel>? organizationList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(organizationList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaOrganizationState value) initial,
    required TResult Function(LoadingOrganizationState value) loading,
    required TResult Function(DataOrganizationState value) data,
    required TResult Function(OrganizationError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaOrganizationState value)? initial,
    TResult? Function(LoadingOrganizationState value)? loading,
    TResult? Function(DataOrganizationState value)? data,
    TResult? Function(OrganizationError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaOrganizationState value)? initial,
    TResult Function(LoadingOrganizationState value)? loading,
    TResult Function(DataOrganizationState value)? data,
    TResult Function(OrganizationError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DataOrganizationState implements OrganizationState {
  const factory DataOrganizationState(
          {required final List<OrganizationModel>? organizationList}) =
      _$DataOrganizationStateImpl;

  List<OrganizationModel>? get organizationList;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataOrganizationStateImplCopyWith<_$DataOrganizationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrganizationErrorImplCopyWith<$Res> {
  factory _$$OrganizationErrorImplCopyWith(_$OrganizationErrorImpl value,
          $Res Function(_$OrganizationErrorImpl) then) =
      __$$OrganizationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OrganizationErrorImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$OrganizationErrorImpl>
    implements _$$OrganizationErrorImplCopyWith<$Res> {
  __$$OrganizationErrorImplCopyWithImpl(_$OrganizationErrorImpl _value,
      $Res Function(_$OrganizationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OrganizationErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrganizationErrorImpl implements OrganizationError {
  const _$OrganizationErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrganizationState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationErrorImplCopyWith<_$OrganizationErrorImpl> get copyWith =>
      __$$OrganizationErrorImplCopyWithImpl<_$OrganizationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrganizationModel>? organizationList) data,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrganizationModel>? organizationList)? data,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrganizationModel>? organizationList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaOrganizationState value) initial,
    required TResult Function(LoadingOrganizationState value) loading,
    required TResult Function(DataOrganizationState value) data,
    required TResult Function(OrganizationError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaOrganizationState value)? initial,
    TResult? Function(LoadingOrganizationState value)? loading,
    TResult? Function(DataOrganizationState value)? data,
    TResult? Function(OrganizationError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaOrganizationState value)? initial,
    TResult Function(LoadingOrganizationState value)? loading,
    TResult Function(DataOrganizationState value)? data,
    TResult Function(OrganizationError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrganizationError implements OrganizationState {
  const factory OrganizationError({required final String error}) =
      _$OrganizationErrorImpl;

  String get error;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizationErrorImplCopyWith<_$OrganizationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
