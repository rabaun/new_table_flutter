// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DeviceModel>? deviceModelList) data,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DeviceModel>? deviceModelList)? data,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DeviceModel>? deviceModelList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaDeviceState value) initial,
    required TResult Function(LoadingDeviceState value) loading,
    required TResult Function(DataDeviceState value) data,
    required TResult Function(DeviceError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaDeviceState value)? initial,
    TResult? Function(LoadingDeviceState value)? loading,
    TResult? Function(DataDeviceState value)? data,
    TResult? Function(DeviceError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaDeviceState value)? initial,
    TResult Function(LoadingDeviceState value)? loading,
    TResult Function(DataDeviceState value)? data,
    TResult Function(DeviceError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res, DeviceState>;
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res, $Val extends DeviceState>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitiaDeviceStateImplCopyWith<$Res> {
  factory _$$InitiaDeviceStateImplCopyWith(_$InitiaDeviceStateImpl value,
          $Res Function(_$InitiaDeviceStateImpl) then) =
      __$$InitiaDeviceStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitiaDeviceStateImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$InitiaDeviceStateImpl>
    implements _$$InitiaDeviceStateImplCopyWith<$Res> {
  __$$InitiaDeviceStateImplCopyWithImpl(_$InitiaDeviceStateImpl _value,
      $Res Function(_$InitiaDeviceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitiaDeviceStateImpl implements _InitiaDeviceState {
  const _$InitiaDeviceStateImpl();

  @override
  String toString() {
    return 'DeviceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitiaDeviceStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DeviceModel>? deviceModelList) data,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DeviceModel>? deviceModelList)? data,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DeviceModel>? deviceModelList)? data,
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
    required TResult Function(_InitiaDeviceState value) initial,
    required TResult Function(LoadingDeviceState value) loading,
    required TResult Function(DataDeviceState value) data,
    required TResult Function(DeviceError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaDeviceState value)? initial,
    TResult? Function(LoadingDeviceState value)? loading,
    TResult? Function(DataDeviceState value)? data,
    TResult? Function(DeviceError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaDeviceState value)? initial,
    TResult Function(LoadingDeviceState value)? loading,
    TResult Function(DataDeviceState value)? data,
    TResult Function(DeviceError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitiaDeviceState implements DeviceState {
  const factory _InitiaDeviceState() = _$InitiaDeviceStateImpl;
}

/// @nodoc
abstract class _$$LoadingDeviceStateImplCopyWith<$Res> {
  factory _$$LoadingDeviceStateImplCopyWith(_$LoadingDeviceStateImpl value,
          $Res Function(_$LoadingDeviceStateImpl) then) =
      __$$LoadingDeviceStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingDeviceStateImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$LoadingDeviceStateImpl>
    implements _$$LoadingDeviceStateImplCopyWith<$Res> {
  __$$LoadingDeviceStateImplCopyWithImpl(_$LoadingDeviceStateImpl _value,
      $Res Function(_$LoadingDeviceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingDeviceStateImpl implements LoadingDeviceState {
  const _$LoadingDeviceStateImpl();

  @override
  String toString() {
    return 'DeviceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingDeviceStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DeviceModel>? deviceModelList) data,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DeviceModel>? deviceModelList)? data,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DeviceModel>? deviceModelList)? data,
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
    required TResult Function(_InitiaDeviceState value) initial,
    required TResult Function(LoadingDeviceState value) loading,
    required TResult Function(DataDeviceState value) data,
    required TResult Function(DeviceError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaDeviceState value)? initial,
    TResult? Function(LoadingDeviceState value)? loading,
    TResult? Function(DataDeviceState value)? data,
    TResult? Function(DeviceError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaDeviceState value)? initial,
    TResult Function(LoadingDeviceState value)? loading,
    TResult Function(DataDeviceState value)? data,
    TResult Function(DeviceError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingDeviceState implements DeviceState {
  const factory LoadingDeviceState() = _$LoadingDeviceStateImpl;
}

/// @nodoc
abstract class _$$DataDeviceStateImplCopyWith<$Res> {
  factory _$$DataDeviceStateImplCopyWith(_$DataDeviceStateImpl value,
          $Res Function(_$DataDeviceStateImpl) then) =
      __$$DataDeviceStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DeviceModel>? deviceModelList});
}

/// @nodoc
class __$$DataDeviceStateImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$DataDeviceStateImpl>
    implements _$$DataDeviceStateImplCopyWith<$Res> {
  __$$DataDeviceStateImplCopyWithImpl(
      _$DataDeviceStateImpl _value, $Res Function(_$DataDeviceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceModelList = freezed,
  }) {
    return _then(_$DataDeviceStateImpl(
      deviceModelList: freezed == deviceModelList
          ? _value._deviceModelList
          : deviceModelList // ignore: cast_nullable_to_non_nullable
              as List<DeviceModel>?,
    ));
  }
}

/// @nodoc

class _$DataDeviceStateImpl implements DataDeviceState {
  const _$DataDeviceStateImpl(
      {required final List<DeviceModel>? deviceModelList})
      : _deviceModelList = deviceModelList;

  final List<DeviceModel>? _deviceModelList;
  @override
  List<DeviceModel>? get deviceModelList {
    final value = _deviceModelList;
    if (value == null) return null;
    if (_deviceModelList is EqualUnmodifiableListView) return _deviceModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeviceState.data(deviceModelList: $deviceModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataDeviceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._deviceModelList, _deviceModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_deviceModelList));

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataDeviceStateImplCopyWith<_$DataDeviceStateImpl> get copyWith =>
      __$$DataDeviceStateImplCopyWithImpl<_$DataDeviceStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DeviceModel>? deviceModelList) data,
    required TResult Function(String error) error,
  }) {
    return data(deviceModelList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DeviceModel>? deviceModelList)? data,
    TResult? Function(String error)? error,
  }) {
    return data?.call(deviceModelList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DeviceModel>? deviceModelList)? data,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(deviceModelList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitiaDeviceState value) initial,
    required TResult Function(LoadingDeviceState value) loading,
    required TResult Function(DataDeviceState value) data,
    required TResult Function(DeviceError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaDeviceState value)? initial,
    TResult? Function(LoadingDeviceState value)? loading,
    TResult? Function(DataDeviceState value)? data,
    TResult? Function(DeviceError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaDeviceState value)? initial,
    TResult Function(LoadingDeviceState value)? loading,
    TResult Function(DataDeviceState value)? data,
    TResult Function(DeviceError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DataDeviceState implements DeviceState {
  const factory DataDeviceState(
          {required final List<DeviceModel>? deviceModelList}) =
      _$DataDeviceStateImpl;

  List<DeviceModel>? get deviceModelList;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataDeviceStateImplCopyWith<_$DataDeviceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceErrorImplCopyWith<$Res> {
  factory _$$DeviceErrorImplCopyWith(
          _$DeviceErrorImpl value, $Res Function(_$DeviceErrorImpl) then) =
      __$$DeviceErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DeviceErrorImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$DeviceErrorImpl>
    implements _$$DeviceErrorImplCopyWith<$Res> {
  __$$DeviceErrorImplCopyWithImpl(
      _$DeviceErrorImpl _value, $Res Function(_$DeviceErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DeviceErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeviceErrorImpl implements DeviceError {
  const _$DeviceErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'DeviceState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceErrorImplCopyWith<_$DeviceErrorImpl> get copyWith =>
      __$$DeviceErrorImplCopyWithImpl<_$DeviceErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DeviceModel>? deviceModelList) data,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DeviceModel>? deviceModelList)? data,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DeviceModel>? deviceModelList)? data,
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
    required TResult Function(_InitiaDeviceState value) initial,
    required TResult Function(LoadingDeviceState value) loading,
    required TResult Function(DataDeviceState value) data,
    required TResult Function(DeviceError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitiaDeviceState value)? initial,
    TResult? Function(LoadingDeviceState value)? loading,
    TResult? Function(DataDeviceState value)? data,
    TResult? Function(DeviceError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitiaDeviceState value)? initial,
    TResult Function(LoadingDeviceState value)? loading,
    TResult Function(DataDeviceState value)? data,
    TResult Function(DeviceError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeviceError implements DeviceState {
  const factory DeviceError({required final String error}) = _$DeviceErrorImpl;

  String get error;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceErrorImplCopyWith<_$DeviceErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
