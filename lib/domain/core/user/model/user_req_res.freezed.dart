// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_req_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserReqRes _$UserReqResFromJson(Map<String, dynamic> json) {
  return RequestData.fromJson(json);
}

/// @nodoc
mixin _$UserReqRes {
  String? get name => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, String? job) requestData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? name, String? job)? requestData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, String? job)? requestData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestData value) requestData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestData value)? requestData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestData value)? requestData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReqResCopyWith<UserReqRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReqResCopyWith<$Res> {
  factory $UserReqResCopyWith(
          UserReqRes value, $Res Function(UserReqRes) then) =
      _$UserReqResCopyWithImpl<$Res, UserReqRes>;
  @useResult
  $Res call({String? name, String? job});
}

/// @nodoc
class _$UserReqResCopyWithImpl<$Res, $Val extends UserReqRes>
    implements $UserReqResCopyWith<$Res> {
  _$UserReqResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? job = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestDataImplCopyWith<$Res>
    implements $UserReqResCopyWith<$Res> {
  factory _$$RequestDataImplCopyWith(
          _$RequestDataImpl value, $Res Function(_$RequestDataImpl) then) =
      __$$RequestDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? job});
}

/// @nodoc
class __$$RequestDataImplCopyWithImpl<$Res>
    extends _$UserReqResCopyWithImpl<$Res, _$RequestDataImpl>
    implements _$$RequestDataImplCopyWith<$Res> {
  __$$RequestDataImplCopyWithImpl(
      _$RequestDataImpl _value, $Res Function(_$RequestDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? job = freezed,
  }) {
    return _then(_$RequestDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestDataImpl implements RequestData {
  const _$RequestDataImpl({this.name, this.job});

  factory _$RequestDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? job;

  @override
  String toString() {
    return 'UserReqRes.requestData(name: $name, job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDataImplCopyWith<_$RequestDataImpl> get copyWith =>
      __$$RequestDataImplCopyWithImpl<_$RequestDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? name, String? job) requestData,
  }) {
    return requestData(name, job);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? name, String? job)? requestData,
  }) {
    return requestData?.call(name, job);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? name, String? job)? requestData,
    required TResult orElse(),
  }) {
    if (requestData != null) {
      return requestData(name, job);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestData value) requestData,
  }) {
    return requestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestData value)? requestData,
  }) {
    return requestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestData value)? requestData,
    required TResult orElse(),
  }) {
    if (requestData != null) {
      return requestData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDataImplToJson(
      this,
    );
  }
}

abstract class RequestData implements UserReqRes {
  const factory RequestData({final String? name, final String? job}) =
      _$RequestDataImpl;

  factory RequestData.fromJson(Map<String, dynamic> json) =
      _$RequestDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get job;
  @override
  @JsonKey(ignore: true)
  _$$RequestDataImplCopyWith<_$RequestDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
