// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PictureItemModel _$PictureItemModelFromJson(Map<String, dynamic> json) {
  return _PictureItemModel.fromJson(json);
}

/// @nodoc
mixin _$PictureItemModel {
  @JsonKey(name: 'media_type')
  String get mediaType => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get copyright => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PictureItemModelCopyWith<PictureItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureItemModelCopyWith<$Res> {
  factory $PictureItemModelCopyWith(
          PictureItemModel value, $Res Function(PictureItemModel) then) =
      _$PictureItemModelCopyWithImpl<$Res, PictureItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'media_type') String mediaType,
      String date,
      String explanation,
      String title,
      String url,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      String? copyright});
}

/// @nodoc
class _$PictureItemModelCopyWithImpl<$Res, $Val extends PictureItemModel>
    implements $PictureItemModelCopyWith<$Res> {
  _$PictureItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaType = null,
    Object? date = null,
    Object? explanation = null,
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? copyright = freezed,
  }) {
    return _then(_value.copyWith(
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureItemModelImplCopyWith<$Res>
    implements $PictureItemModelCopyWith<$Res> {
  factory _$$PictureItemModelImplCopyWith(_$PictureItemModelImpl value,
          $Res Function(_$PictureItemModelImpl) then) =
      __$$PictureItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'media_type') String mediaType,
      String date,
      String explanation,
      String title,
      String url,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      String? copyright});
}

/// @nodoc
class __$$PictureItemModelImplCopyWithImpl<$Res>
    extends _$PictureItemModelCopyWithImpl<$Res, _$PictureItemModelImpl>
    implements _$$PictureItemModelImplCopyWith<$Res> {
  __$$PictureItemModelImplCopyWithImpl(_$PictureItemModelImpl _value,
      $Res Function(_$PictureItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaType = null,
    Object? date = null,
    Object? explanation = null,
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? copyright = freezed,
  }) {
    return _then(_$PictureItemModelImpl(
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureItemModelImpl extends _PictureItemModel
    with DiagnosticableTreeMixin {
  const _$PictureItemModelImpl(
      {@JsonKey(name: 'media_type') required this.mediaType,
      required this.date,
      required this.explanation,
      required this.title,
      required this.url,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl,
      this.copyright})
      : super._();

  factory _$PictureItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'media_type')
  final String mediaType;
  @override
  final String date;
  @override
  final String explanation;
  @override
  final String title;
  @override
  final String url;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  @override
  final String? copyright;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PictureItemModel(mediaType: $mediaType, date: $date, explanation: $explanation, title: $title, url: $url, thumbnailUrl: $thumbnailUrl, copyright: $copyright)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PictureItemModel'))
      ..add(DiagnosticsProperty('mediaType', mediaType))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('explanation', explanation))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl))
      ..add(DiagnosticsProperty('copyright', copyright));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureItemModelImpl &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mediaType, date, explanation,
      title, url, thumbnailUrl, copyright);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureItemModelImplCopyWith<_$PictureItemModelImpl> get copyWith =>
      __$$PictureItemModelImplCopyWithImpl<_$PictureItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureItemModelImplToJson(
      this,
    );
  }
}

abstract class _PictureItemModel extends PictureItemModel {
  const factory _PictureItemModel(
      {@JsonKey(name: 'media_type') required final String mediaType,
      required final String date,
      required final String explanation,
      required final String title,
      required final String url,
      @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
      final String? copyright}) = _$PictureItemModelImpl;
  const _PictureItemModel._() : super._();

  factory _PictureItemModel.fromJson(Map<String, dynamic> json) =
      _$PictureItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'media_type')
  String get mediaType;
  @override
  String get date;
  @override
  String get explanation;
  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  String? get copyright;
  @override
  @JsonKey(ignore: true)
  _$$PictureItemModelImplCopyWith<_$PictureItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
