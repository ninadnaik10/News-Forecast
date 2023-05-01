// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherState {
  bool get isLoading => throw _privateConstructorUsedError;
  WeatherModel get weatherModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call({bool isLoading, WeatherModel weatherModel});
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? weatherModel = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherModel: null == weatherModel
          ? _value.weatherModel
          : weatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$_WeatherStateCopyWith(
          _$_WeatherState value, $Res Function(_$_WeatherState) then) =
      __$$_WeatherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, WeatherModel weatherModel});
}

/// @nodoc
class __$$_WeatherStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$_WeatherState>
    implements _$$_WeatherStateCopyWith<$Res> {
  __$$_WeatherStateCopyWithImpl(
      _$_WeatherState _value, $Res Function(_$_WeatherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? weatherModel = null,
  }) {
    return _then(_$_WeatherState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherModel: null == weatherModel
          ? _value.weatherModel
          : weatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
    ));
  }
}

/// @nodoc

class _$_WeatherState extends _WeatherState {
  const _$_WeatherState({this.isLoading = true, required this.weatherModel})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final WeatherModel weatherModel;

  @override
  String toString() {
    return 'WeatherState(isLoading: $isLoading, weatherModel: $weatherModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.weatherModel, weatherModel) ||
                other.weatherModel == weatherModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, weatherModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      __$$_WeatherStateCopyWithImpl<_$_WeatherState>(this, _$identity);
}

abstract class _WeatherState extends WeatherState {
  const factory _WeatherState(
      {final bool isLoading,
      required final WeatherModel weatherModel}) = _$_WeatherState;
  const _WeatherState._() : super._();

  @override
  bool get isLoading;
  @override
  WeatherModel get weatherModel;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}
