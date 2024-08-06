// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mantenimiento_tablero_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MantenimientoTableroState {
  MantenimientoTablero get mantenimientoTablero =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MantenimientoTableroStateCopyWith<MantenimientoTableroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MantenimientoTableroStateCopyWith<$Res> {
  factory $MantenimientoTableroStateCopyWith(MantenimientoTableroState value,
          $Res Function(MantenimientoTableroState) then) =
      _$MantenimientoTableroStateCopyWithImpl<$Res, MantenimientoTableroState>;
  @useResult
  $Res call({MantenimientoTablero mantenimientoTablero});

  $MantenimientoTableroCopyWith<$Res> get mantenimientoTablero;
}

/// @nodoc
class _$MantenimientoTableroStateCopyWithImpl<$Res,
        $Val extends MantenimientoTableroState>
    implements $MantenimientoTableroStateCopyWith<$Res> {
  _$MantenimientoTableroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mantenimientoTablero = null,
  }) {
    return _then(_value.copyWith(
      mantenimientoTablero: null == mantenimientoTablero
          ? _value.mantenimientoTablero
          : mantenimientoTablero // ignore: cast_nullable_to_non_nullable
              as MantenimientoTablero,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MantenimientoTableroCopyWith<$Res> get mantenimientoTablero {
    return $MantenimientoTableroCopyWith<$Res>(_value.mantenimientoTablero,
        (value) {
      return _then(_value.copyWith(mantenimientoTablero: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MantenimientoTableroStateImplCopyWith<$Res>
    implements $MantenimientoTableroStateCopyWith<$Res> {
  factory _$$MantenimientoTableroStateImplCopyWith(
          _$MantenimientoTableroStateImpl value,
          $Res Function(_$MantenimientoTableroStateImpl) then) =
      __$$MantenimientoTableroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MantenimientoTablero mantenimientoTablero});

  @override
  $MantenimientoTableroCopyWith<$Res> get mantenimientoTablero;
}

/// @nodoc
class __$$MantenimientoTableroStateImplCopyWithImpl<$Res>
    extends _$MantenimientoTableroStateCopyWithImpl<$Res,
        _$MantenimientoTableroStateImpl>
    implements _$$MantenimientoTableroStateImplCopyWith<$Res> {
  __$$MantenimientoTableroStateImplCopyWithImpl(
      _$MantenimientoTableroStateImpl _value,
      $Res Function(_$MantenimientoTableroStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mantenimientoTablero = null,
  }) {
    return _then(_$MantenimientoTableroStateImpl(
      mantenimientoTablero: null == mantenimientoTablero
          ? _value.mantenimientoTablero
          : mantenimientoTablero // ignore: cast_nullable_to_non_nullable
              as MantenimientoTablero,
    ));
  }
}

/// @nodoc

class _$MantenimientoTableroStateImpl implements _MantenimientoTableroState {
  const _$MantenimientoTableroStateImpl({required this.mantenimientoTablero});

  @override
  final MantenimientoTablero mantenimientoTablero;

  @override
  String toString() {
    return 'MantenimientoTableroState(mantenimientoTablero: $mantenimientoTablero)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MantenimientoTableroStateImpl &&
            (identical(other.mantenimientoTablero, mantenimientoTablero) ||
                other.mantenimientoTablero == mantenimientoTablero));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mantenimientoTablero);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MantenimientoTableroStateImplCopyWith<_$MantenimientoTableroStateImpl>
      get copyWith => __$$MantenimientoTableroStateImplCopyWithImpl<
          _$MantenimientoTableroStateImpl>(this, _$identity);
}

abstract class _MantenimientoTableroState implements MantenimientoTableroState {
  const factory _MantenimientoTableroState(
          {required final MantenimientoTablero mantenimientoTablero}) =
      _$MantenimientoTableroStateImpl;

  @override
  MantenimientoTablero get mantenimientoTablero;
  @override
  @JsonKey(ignore: true)
  _$$MantenimientoTableroStateImplCopyWith<_$MantenimientoTableroStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
