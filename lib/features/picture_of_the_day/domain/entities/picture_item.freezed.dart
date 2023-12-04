// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PictureItem {
  DateTime get date => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureItemCopyWith<PictureItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureItemCopyWith<$Res> {
  factory $PictureItemCopyWith(
          PictureItem value, $Res Function(PictureItem) then) =
      _$PictureItemCopyWithImpl<$Res, PictureItem>;
  @useResult
  $Res call({DateTime date, String explanation, String title, String imageUrl});
}

/// @nodoc
class _$PictureItemCopyWithImpl<$Res, $Val extends PictureItem>
    implements $PictureItemCopyWith<$Res> {
  _$PictureItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? explanation = null,
    Object? title = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureItemImplCopyWith<$Res>
    implements $PictureItemCopyWith<$Res> {
  factory _$$PictureItemImplCopyWith(
          _$PictureItemImpl value, $Res Function(_$PictureItemImpl) then) =
      __$$PictureItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String explanation, String title, String imageUrl});
}

/// @nodoc
class __$$PictureItemImplCopyWithImpl<$Res>
    extends _$PictureItemCopyWithImpl<$Res, _$PictureItemImpl>
    implements _$$PictureItemImplCopyWith<$Res> {
  __$$PictureItemImplCopyWithImpl(
      _$PictureItemImpl _value, $Res Function(_$PictureItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? explanation = null,
    Object? title = null,
    Object? imageUrl = null,
  }) {
    return _then(_$PictureItemImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PictureItemImpl with DiagnosticableTreeMixin implements _PictureItem {
  const _$PictureItemImpl(
      {required this.date,
      required this.explanation,
      required this.title,
      required this.imageUrl});

  @override
  final DateTime date;
  @override
  final String explanation;
  @override
  final String title;
  @override
  final String imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PictureItem(date: $date, explanation: $explanation, title: $title, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PictureItem'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('explanation', explanation))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureItemImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, explanation, title, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureItemImplCopyWith<_$PictureItemImpl> get copyWith =>
      __$$PictureItemImplCopyWithImpl<_$PictureItemImpl>(this, _$identity);
}

abstract class _PictureItem implements PictureItem {
  const factory _PictureItem(
      {required final DateTime date,
      required final String explanation,
      required final String title,
      required final String imageUrl}) = _$PictureItemImpl;

  @override
  DateTime get date;
  @override
  String get explanation;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$PictureItemImplCopyWith<_$PictureItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
