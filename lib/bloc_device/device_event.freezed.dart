// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeviceModel? device) addDevice,
    required TResult Function() getDevice,
    required TResult Function(DeviceModel? device) remove,
    required TResult Function(DeviceModel? device) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeviceModel? device)? addDevice,
    TResult? Function()? getDevice,
    TResult? Function(DeviceModel? device)? remove,
    TResult? Function(DeviceModel? device)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeviceModel? device)? addDevice,
    TResult Function()? getDevice,
    TResult Function(DeviceModel? device)? remove,
    TResult Function(DeviceModel? device)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(AddDeviceEvent value) addDevice,
    required TResult Function(GetDeviceEvent value) getDevice,
    required TResult Function(DeleteDeviceEvent value) remove,
    required TResult Function(UpdateDeviceEvent value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(AddDeviceEvent value)? addDevice,
    TResult? Function(GetDeviceEvent value)? getDevice,
    TResult? Function(DeleteDeviceEvent value)? remove,
    TResult? Function(UpdateDeviceEvent value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(AddDeviceEvent value)? addDevice,
    TResult Function(GetDeviceEvent value)? getDevice,
    TResult Function(DeleteDeviceEvent value)? remove,
    TResult Function(UpdateDeviceEvent value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceEventCopyWith<$Res> {
  factory $DeviceEventCopyWith(
          DeviceEvent value, $Res Function(DeviceEvent) then) =
      _$DeviceEventCopyWithImpl<$Res, DeviceEvent>;
}

/// @nodoc
class _$DeviceEventCopyWithImpl<$Res, $Val extends DeviceEvent>
    implements $DeviceEventCopyWith<$Res> {
  _$DeviceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DeviceEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DeviceEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeviceModel? device) addDevice,
    required TResult Function() getDevice,
    required TResult Function(DeviceModel? device) remove,
    required TResult Function(DeviceModel? device) update,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeviceModel? device)? addDevice,
    TResult? Function()? getDevice,
    TResult? Function(DeviceModel? device)? remove,
    TResult? Function(DeviceModel? device)? update,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeviceModel? device)? addDevice,
    TResult Function()? getDevice,
    TResult Function(DeviceModel? device)? remove,
    TResult Function(DeviceModel? device)? update,
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
    required TResult Function(Initial value) initial,
    required TResult Function(AddDeviceEvent value) addDevice,
    required TResult Function(GetDeviceEvent value) getDevice,
    required TResult Function(DeleteDeviceEvent value) remove,
    required TResult Function(UpdateDeviceEvent value) update,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(AddDeviceEvent value)? addDevice,
    TResult? Function(GetDeviceEvent value)? getDevice,
    TResult? Function(DeleteDeviceEvent value)? remove,
    TResult? Function(UpdateDeviceEvent value)? update,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(AddDeviceEvent value)? addDevice,
    TResult Function(GetDeviceEvent value)? getDevice,
    TResult Function(DeleteDeviceEvent value)? remove,
    TResult Function(UpdateDeviceEvent value)? update,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DeviceEvent {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddDeviceEventImplCopyWith<$Res> {
  factory _$$AddDeviceEventImplCopyWith(_$AddDeviceEventImpl value,
          $Res Function(_$AddDeviceEventImpl) then) =
      __$$AddDeviceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceModel? device});

  $DeviceModelCopyWith<$Res>? get device;
}

/// @nodoc
class __$$AddDeviceEventImplCopyWithImpl<$Res>
    extends _$DeviceEventCopyWithImpl<$Res, _$AddDeviceEventImpl>
    implements _$$AddDeviceEventImplCopyWith<$Res> {
  __$$AddDeviceEventImplCopyWithImpl(
      _$AddDeviceEventImpl _value, $Res Function(_$AddDeviceEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_$AddDeviceEventImpl(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceModel?,
    ));
  }

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceModelCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceModelCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$AddDeviceEventImpl implements AddDeviceEvent {
  const _$AddDeviceEventImpl({required this.device});

  @override
  final DeviceModel? device;

  @override
  String toString() {
    return 'DeviceEvent.addDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDeviceEventImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDeviceEventImplCopyWith<_$AddDeviceEventImpl> get copyWith =>
      __$$AddDeviceEventImplCopyWithImpl<_$AddDeviceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeviceModel? device) addDevice,
    required TResult Function() getDevice,
    required TResult Function(DeviceModel? device) remove,
    required TResult Function(DeviceModel? device) update,
  }) {
    return addDevice(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeviceModel? device)? addDevice,
    TResult? Function()? getDevice,
    TResult? Function(DeviceModel? device)? remove,
    TResult? Function(DeviceModel? device)? update,
  }) {
    return addDevice?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeviceModel? device)? addDevice,
    TResult Function()? getDevice,
    TResult Function(DeviceModel? device)? remove,
    TResult Function(DeviceModel? device)? update,
    required TResult orElse(),
  }) {
    if (addDevice != null) {
      return addDevice(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(AddDeviceEvent value) addDevice,
    required TResult Function(GetDeviceEvent value) getDevice,
    required TResult Function(DeleteDeviceEvent value) remove,
    required TResult Function(UpdateDeviceEvent value) update,
  }) {
    return addDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(AddDeviceEvent value)? addDevice,
    TResult? Function(GetDeviceEvent value)? getDevice,
    TResult? Function(DeleteDeviceEvent value)? remove,
    TResult? Function(UpdateDeviceEvent value)? update,
  }) {
    return addDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(AddDeviceEvent value)? addDevice,
    TResult Function(GetDeviceEvent value)? getDevice,
    TResult Function(DeleteDeviceEvent value)? remove,
    TResult Function(UpdateDeviceEvent value)? update,
    required TResult orElse(),
  }) {
    if (addDevice != null) {
      return addDevice(this);
    }
    return orElse();
  }
}

abstract class AddDeviceEvent implements DeviceEvent {
  const factory AddDeviceEvent({required final DeviceModel? device}) =
      _$AddDeviceEventImpl;

  DeviceModel? get device;

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDeviceEventImplCopyWith<_$AddDeviceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDeviceEventImplCopyWith<$Res> {
  factory _$$GetDeviceEventImplCopyWith(_$GetDeviceEventImpl value,
          $Res Function(_$GetDeviceEventImpl) then) =
      __$$GetDeviceEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDeviceEventImplCopyWithImpl<$Res>
    extends _$DeviceEventCopyWithImpl<$Res, _$GetDeviceEventImpl>
    implements _$$GetDeviceEventImplCopyWith<$Res> {
  __$$GetDeviceEventImplCopyWithImpl(
      _$GetDeviceEventImpl _value, $Res Function(_$GetDeviceEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetDeviceEventImpl implements GetDeviceEvent {
  const _$GetDeviceEventImpl();

  @override
  String toString() {
    return 'DeviceEvent.getDevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDeviceEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeviceModel? device) addDevice,
    required TResult Function() getDevice,
    required TResult Function(DeviceModel? device) remove,
    required TResult Function(DeviceModel? device) update,
  }) {
    return getDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeviceModel? device)? addDevice,
    TResult? Function()? getDevice,
    TResult? Function(DeviceModel? device)? remove,
    TResult? Function(DeviceModel? device)? update,
  }) {
    return getDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeviceModel? device)? addDevice,
    TResult Function()? getDevice,
    TResult Function(DeviceModel? device)? remove,
    TResult Function(DeviceModel? device)? update,
    required TResult orElse(),
  }) {
    if (getDevice != null) {
      return getDevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(AddDeviceEvent value) addDevice,
    required TResult Function(GetDeviceEvent value) getDevice,
    required TResult Function(DeleteDeviceEvent value) remove,
    required TResult Function(UpdateDeviceEvent value) update,
  }) {
    return getDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(AddDeviceEvent value)? addDevice,
    TResult? Function(GetDeviceEvent value)? getDevice,
    TResult? Function(DeleteDeviceEvent value)? remove,
    TResult? Function(UpdateDeviceEvent value)? update,
  }) {
    return getDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(AddDeviceEvent value)? addDevice,
    TResult Function(GetDeviceEvent value)? getDevice,
    TResult Function(DeleteDeviceEvent value)? remove,
    TResult Function(UpdateDeviceEvent value)? update,
    required TResult orElse(),
  }) {
    if (getDevice != null) {
      return getDevice(this);
    }
    return orElse();
  }
}

abstract class GetDeviceEvent implements DeviceEvent {
  const factory GetDeviceEvent() = _$GetDeviceEventImpl;
}

/// @nodoc
abstract class _$$DeleteDeviceEventImplCopyWith<$Res> {
  factory _$$DeleteDeviceEventImplCopyWith(_$DeleteDeviceEventImpl value,
          $Res Function(_$DeleteDeviceEventImpl) then) =
      __$$DeleteDeviceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceModel? device});

  $DeviceModelCopyWith<$Res>? get device;
}

/// @nodoc
class __$$DeleteDeviceEventImplCopyWithImpl<$Res>
    extends _$DeviceEventCopyWithImpl<$Res, _$DeleteDeviceEventImpl>
    implements _$$DeleteDeviceEventImplCopyWith<$Res> {
  __$$DeleteDeviceEventImplCopyWithImpl(_$DeleteDeviceEventImpl _value,
      $Res Function(_$DeleteDeviceEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_$DeleteDeviceEventImpl(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceModel?,
    ));
  }

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceModelCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceModelCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$DeleteDeviceEventImpl implements DeleteDeviceEvent {
  const _$DeleteDeviceEventImpl({required this.device});

  @override
  final DeviceModel? device;

  @override
  String toString() {
    return 'DeviceEvent.remove(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDeviceEventImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDeviceEventImplCopyWith<_$DeleteDeviceEventImpl> get copyWith =>
      __$$DeleteDeviceEventImplCopyWithImpl<_$DeleteDeviceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeviceModel? device) addDevice,
    required TResult Function() getDevice,
    required TResult Function(DeviceModel? device) remove,
    required TResult Function(DeviceModel? device) update,
  }) {
    return remove(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeviceModel? device)? addDevice,
    TResult? Function()? getDevice,
    TResult? Function(DeviceModel? device)? remove,
    TResult? Function(DeviceModel? device)? update,
  }) {
    return remove?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeviceModel? device)? addDevice,
    TResult Function()? getDevice,
    TResult Function(DeviceModel? device)? remove,
    TResult Function(DeviceModel? device)? update,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(AddDeviceEvent value) addDevice,
    required TResult Function(GetDeviceEvent value) getDevice,
    required TResult Function(DeleteDeviceEvent value) remove,
    required TResult Function(UpdateDeviceEvent value) update,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(AddDeviceEvent value)? addDevice,
    TResult? Function(GetDeviceEvent value)? getDevice,
    TResult? Function(DeleteDeviceEvent value)? remove,
    TResult? Function(UpdateDeviceEvent value)? update,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(AddDeviceEvent value)? addDevice,
    TResult Function(GetDeviceEvent value)? getDevice,
    TResult Function(DeleteDeviceEvent value)? remove,
    TResult Function(UpdateDeviceEvent value)? update,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class DeleteDeviceEvent implements DeviceEvent {
  const factory DeleteDeviceEvent({required final DeviceModel? device}) =
      _$DeleteDeviceEventImpl;

  DeviceModel? get device;

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteDeviceEventImplCopyWith<_$DeleteDeviceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDeviceEventImplCopyWith<$Res> {
  factory _$$UpdateDeviceEventImplCopyWith(_$UpdateDeviceEventImpl value,
          $Res Function(_$UpdateDeviceEventImpl) then) =
      __$$UpdateDeviceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceModel? device});

  $DeviceModelCopyWith<$Res>? get device;
}

/// @nodoc
class __$$UpdateDeviceEventImplCopyWithImpl<$Res>
    extends _$DeviceEventCopyWithImpl<$Res, _$UpdateDeviceEventImpl>
    implements _$$UpdateDeviceEventImplCopyWith<$Res> {
  __$$UpdateDeviceEventImplCopyWithImpl(_$UpdateDeviceEventImpl _value,
      $Res Function(_$UpdateDeviceEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_$UpdateDeviceEventImpl(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceModel?,
    ));
  }

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceModelCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceModelCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$UpdateDeviceEventImpl implements UpdateDeviceEvent {
  const _$UpdateDeviceEventImpl({required this.device});

  @override
  final DeviceModel? device;

  @override
  String toString() {
    return 'DeviceEvent.update(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeviceEventImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDeviceEventImplCopyWith<_$UpdateDeviceEventImpl> get copyWith =>
      __$$UpdateDeviceEventImplCopyWithImpl<_$UpdateDeviceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeviceModel? device) addDevice,
    required TResult Function() getDevice,
    required TResult Function(DeviceModel? device) remove,
    required TResult Function(DeviceModel? device) update,
  }) {
    return update(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeviceModel? device)? addDevice,
    TResult? Function()? getDevice,
    TResult? Function(DeviceModel? device)? remove,
    TResult? Function(DeviceModel? device)? update,
  }) {
    return update?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeviceModel? device)? addDevice,
    TResult Function()? getDevice,
    TResult Function(DeviceModel? device)? remove,
    TResult Function(DeviceModel? device)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(AddDeviceEvent value) addDevice,
    required TResult Function(GetDeviceEvent value) getDevice,
    required TResult Function(DeleteDeviceEvent value) remove,
    required TResult Function(UpdateDeviceEvent value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(AddDeviceEvent value)? addDevice,
    TResult? Function(GetDeviceEvent value)? getDevice,
    TResult? Function(DeleteDeviceEvent value)? remove,
    TResult? Function(UpdateDeviceEvent value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(AddDeviceEvent value)? addDevice,
    TResult Function(GetDeviceEvent value)? getDevice,
    TResult Function(DeleteDeviceEvent value)? remove,
    TResult Function(UpdateDeviceEvent value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateDeviceEvent implements DeviceEvent {
  const factory UpdateDeviceEvent({required final DeviceModel? device}) =
      _$UpdateDeviceEventImpl;

  DeviceModel? get device;

  /// Create a copy of DeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDeviceEventImplCopyWith<_$UpdateDeviceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
