// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_of_the_day_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PictureOfTheDayEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getAllPictures,
    required TResult Function(String title) searchPicturesByTitle,
    required TResult Function(DateTime date) searchPicturesByDate,
    required TResult Function() cleanFilters,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getAllPictures,
    TResult? Function(String title)? searchPicturesByTitle,
    TResult? Function(DateTime date)? searchPicturesByDate,
    TResult? Function()? cleanFilters,
    TResult? Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getAllPictures,
    TResult Function(String title)? searchPicturesByTitle,
    TResult Function(DateTime date)? searchPicturesByDate,
    TResult Function()? cleanFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllPictures value) getAllPictures,
    required TResult Function(_SearchPicturesByName value)
        searchPicturesByTitle,
    required TResult Function(_SearchPicturesByDate value) searchPicturesByDate,
    required TResult Function(_CleanFilters value) cleanFilters,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllPictures value)? getAllPictures,
    TResult? Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult? Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult? Function(_CleanFilters value)? cleanFilters,
    TResult? Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllPictures value)? getAllPictures,
    TResult Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult Function(_CleanFilters value)? cleanFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureOfTheDayEventCopyWith<$Res> {
  factory $PictureOfTheDayEventCopyWith(PictureOfTheDayEvent value,
          $Res Function(PictureOfTheDayEvent) then) =
      _$PictureOfTheDayEventCopyWithImpl<$Res, PictureOfTheDayEvent>;
}

/// @nodoc
class _$PictureOfTheDayEventCopyWithImpl<$Res,
        $Val extends PictureOfTheDayEvent>
    implements $PictureOfTheDayEventCopyWith<$Res> {
  _$PictureOfTheDayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllPicturesImplCopyWith<$Res> {
  factory _$$GetAllPicturesImplCopyWith(_$GetAllPicturesImpl value,
          $Res Function(_$GetAllPicturesImpl) then) =
      __$$GetAllPicturesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$GetAllPicturesImplCopyWithImpl<$Res>
    extends _$PictureOfTheDayEventCopyWithImpl<$Res, _$GetAllPicturesImpl>
    implements _$$GetAllPicturesImplCopyWith<$Res> {
  __$$GetAllPicturesImplCopyWithImpl(
      _$GetAllPicturesImpl _value, $Res Function(_$GetAllPicturesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$GetAllPicturesImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetAllPicturesImpl implements _GetAllPictures {
  const _$GetAllPicturesImpl(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'PictureOfTheDayEvent.getAllPictures(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllPicturesImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllPicturesImplCopyWith<_$GetAllPicturesImpl> get copyWith =>
      __$$GetAllPicturesImplCopyWithImpl<_$GetAllPicturesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getAllPictures,
    required TResult Function(String title) searchPicturesByTitle,
    required TResult Function(DateTime date) searchPicturesByDate,
    required TResult Function() cleanFilters,
    required TResult Function() refresh,
  }) {
    return getAllPictures(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getAllPictures,
    TResult? Function(String title)? searchPicturesByTitle,
    TResult? Function(DateTime date)? searchPicturesByDate,
    TResult? Function()? cleanFilters,
    TResult? Function()? refresh,
  }) {
    return getAllPictures?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getAllPictures,
    TResult Function(String title)? searchPicturesByTitle,
    TResult Function(DateTime date)? searchPicturesByDate,
    TResult Function()? cleanFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (getAllPictures != null) {
      return getAllPictures(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllPictures value) getAllPictures,
    required TResult Function(_SearchPicturesByName value)
        searchPicturesByTitle,
    required TResult Function(_SearchPicturesByDate value) searchPicturesByDate,
    required TResult Function(_CleanFilters value) cleanFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return getAllPictures(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllPictures value)? getAllPictures,
    TResult? Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult? Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult? Function(_CleanFilters value)? cleanFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return getAllPictures?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllPictures value)? getAllPictures,
    TResult Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult Function(_CleanFilters value)? cleanFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (getAllPictures != null) {
      return getAllPictures(this);
    }
    return orElse();
  }
}

abstract class _GetAllPictures implements PictureOfTheDayEvent {
  const factory _GetAllPictures(final int page) = _$GetAllPicturesImpl;

  int get page;
  @JsonKey(ignore: true)
  _$$GetAllPicturesImplCopyWith<_$GetAllPicturesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchPicturesByNameImplCopyWith<$Res> {
  factory _$$SearchPicturesByNameImplCopyWith(_$SearchPicturesByNameImpl value,
          $Res Function(_$SearchPicturesByNameImpl) then) =
      __$$SearchPicturesByNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$SearchPicturesByNameImplCopyWithImpl<$Res>
    extends _$PictureOfTheDayEventCopyWithImpl<$Res, _$SearchPicturesByNameImpl>
    implements _$$SearchPicturesByNameImplCopyWith<$Res> {
  __$$SearchPicturesByNameImplCopyWithImpl(_$SearchPicturesByNameImpl _value,
      $Res Function(_$SearchPicturesByNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$SearchPicturesByNameImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchPicturesByNameImpl implements _SearchPicturesByName {
  const _$SearchPicturesByNameImpl(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'PictureOfTheDayEvent.searchPicturesByTitle(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPicturesByNameImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPicturesByNameImplCopyWith<_$SearchPicturesByNameImpl>
      get copyWith =>
          __$$SearchPicturesByNameImplCopyWithImpl<_$SearchPicturesByNameImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getAllPictures,
    required TResult Function(String title) searchPicturesByTitle,
    required TResult Function(DateTime date) searchPicturesByDate,
    required TResult Function() cleanFilters,
    required TResult Function() refresh,
  }) {
    return searchPicturesByTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getAllPictures,
    TResult? Function(String title)? searchPicturesByTitle,
    TResult? Function(DateTime date)? searchPicturesByDate,
    TResult? Function()? cleanFilters,
    TResult? Function()? refresh,
  }) {
    return searchPicturesByTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getAllPictures,
    TResult Function(String title)? searchPicturesByTitle,
    TResult Function(DateTime date)? searchPicturesByDate,
    TResult Function()? cleanFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (searchPicturesByTitle != null) {
      return searchPicturesByTitle(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllPictures value) getAllPictures,
    required TResult Function(_SearchPicturesByName value)
        searchPicturesByTitle,
    required TResult Function(_SearchPicturesByDate value) searchPicturesByDate,
    required TResult Function(_CleanFilters value) cleanFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return searchPicturesByTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllPictures value)? getAllPictures,
    TResult? Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult? Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult? Function(_CleanFilters value)? cleanFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return searchPicturesByTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllPictures value)? getAllPictures,
    TResult Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult Function(_CleanFilters value)? cleanFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (searchPicturesByTitle != null) {
      return searchPicturesByTitle(this);
    }
    return orElse();
  }
}

abstract class _SearchPicturesByName implements PictureOfTheDayEvent {
  const factory _SearchPicturesByName(final String title) =
      _$SearchPicturesByNameImpl;

  String get title;
  @JsonKey(ignore: true)
  _$$SearchPicturesByNameImplCopyWith<_$SearchPicturesByNameImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchPicturesByDateImplCopyWith<$Res> {
  factory _$$SearchPicturesByDateImplCopyWith(_$SearchPicturesByDateImpl value,
          $Res Function(_$SearchPicturesByDateImpl) then) =
      __$$SearchPicturesByDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$SearchPicturesByDateImplCopyWithImpl<$Res>
    extends _$PictureOfTheDayEventCopyWithImpl<$Res, _$SearchPicturesByDateImpl>
    implements _$$SearchPicturesByDateImplCopyWith<$Res> {
  __$$SearchPicturesByDateImplCopyWithImpl(_$SearchPicturesByDateImpl _value,
      $Res Function(_$SearchPicturesByDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$SearchPicturesByDateImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SearchPicturesByDateImpl implements _SearchPicturesByDate {
  const _$SearchPicturesByDateImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'PictureOfTheDayEvent.searchPicturesByDate(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPicturesByDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPicturesByDateImplCopyWith<_$SearchPicturesByDateImpl>
      get copyWith =>
          __$$SearchPicturesByDateImplCopyWithImpl<_$SearchPicturesByDateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getAllPictures,
    required TResult Function(String title) searchPicturesByTitle,
    required TResult Function(DateTime date) searchPicturesByDate,
    required TResult Function() cleanFilters,
    required TResult Function() refresh,
  }) {
    return searchPicturesByDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getAllPictures,
    TResult? Function(String title)? searchPicturesByTitle,
    TResult? Function(DateTime date)? searchPicturesByDate,
    TResult? Function()? cleanFilters,
    TResult? Function()? refresh,
  }) {
    return searchPicturesByDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getAllPictures,
    TResult Function(String title)? searchPicturesByTitle,
    TResult Function(DateTime date)? searchPicturesByDate,
    TResult Function()? cleanFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (searchPicturesByDate != null) {
      return searchPicturesByDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllPictures value) getAllPictures,
    required TResult Function(_SearchPicturesByName value)
        searchPicturesByTitle,
    required TResult Function(_SearchPicturesByDate value) searchPicturesByDate,
    required TResult Function(_CleanFilters value) cleanFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return searchPicturesByDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllPictures value)? getAllPictures,
    TResult? Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult? Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult? Function(_CleanFilters value)? cleanFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return searchPicturesByDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllPictures value)? getAllPictures,
    TResult Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult Function(_CleanFilters value)? cleanFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (searchPicturesByDate != null) {
      return searchPicturesByDate(this);
    }
    return orElse();
  }
}

abstract class _SearchPicturesByDate implements PictureOfTheDayEvent {
  const factory _SearchPicturesByDate(final DateTime date) =
      _$SearchPicturesByDateImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$SearchPicturesByDateImplCopyWith<_$SearchPicturesByDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CleanFiltersImplCopyWith<$Res> {
  factory _$$CleanFiltersImplCopyWith(
          _$CleanFiltersImpl value, $Res Function(_$CleanFiltersImpl) then) =
      __$$CleanFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CleanFiltersImplCopyWithImpl<$Res>
    extends _$PictureOfTheDayEventCopyWithImpl<$Res, _$CleanFiltersImpl>
    implements _$$CleanFiltersImplCopyWith<$Res> {
  __$$CleanFiltersImplCopyWithImpl(
      _$CleanFiltersImpl _value, $Res Function(_$CleanFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CleanFiltersImpl implements _CleanFilters {
  const _$CleanFiltersImpl();

  @override
  String toString() {
    return 'PictureOfTheDayEvent.cleanFilters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CleanFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getAllPictures,
    required TResult Function(String title) searchPicturesByTitle,
    required TResult Function(DateTime date) searchPicturesByDate,
    required TResult Function() cleanFilters,
    required TResult Function() refresh,
  }) {
    return cleanFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getAllPictures,
    TResult? Function(String title)? searchPicturesByTitle,
    TResult? Function(DateTime date)? searchPicturesByDate,
    TResult? Function()? cleanFilters,
    TResult? Function()? refresh,
  }) {
    return cleanFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getAllPictures,
    TResult Function(String title)? searchPicturesByTitle,
    TResult Function(DateTime date)? searchPicturesByDate,
    TResult Function()? cleanFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (cleanFilters != null) {
      return cleanFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllPictures value) getAllPictures,
    required TResult Function(_SearchPicturesByName value)
        searchPicturesByTitle,
    required TResult Function(_SearchPicturesByDate value) searchPicturesByDate,
    required TResult Function(_CleanFilters value) cleanFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return cleanFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllPictures value)? getAllPictures,
    TResult? Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult? Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult? Function(_CleanFilters value)? cleanFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return cleanFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllPictures value)? getAllPictures,
    TResult Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult Function(_CleanFilters value)? cleanFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (cleanFilters != null) {
      return cleanFilters(this);
    }
    return orElse();
  }
}

abstract class _CleanFilters implements PictureOfTheDayEvent {
  const factory _CleanFilters() = _$CleanFiltersImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$PictureOfTheDayEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'PictureOfTheDayEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getAllPictures,
    required TResult Function(String title) searchPicturesByTitle,
    required TResult Function(DateTime date) searchPicturesByDate,
    required TResult Function() cleanFilters,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getAllPictures,
    TResult? Function(String title)? searchPicturesByTitle,
    TResult? Function(DateTime date)? searchPicturesByDate,
    TResult? Function()? cleanFilters,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getAllPictures,
    TResult Function(String title)? searchPicturesByTitle,
    TResult Function(DateTime date)? searchPicturesByDate,
    TResult Function()? cleanFilters,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllPictures value) getAllPictures,
    required TResult Function(_SearchPicturesByName value)
        searchPicturesByTitle,
    required TResult Function(_SearchPicturesByDate value) searchPicturesByDate,
    required TResult Function(_CleanFilters value) cleanFilters,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllPictures value)? getAllPictures,
    TResult? Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult? Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult? Function(_CleanFilters value)? cleanFilters,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllPictures value)? getAllPictures,
    TResult Function(_SearchPicturesByName value)? searchPicturesByTitle,
    TResult Function(_SearchPicturesByDate value)? searchPicturesByDate,
    TResult Function(_CleanFilters value)? cleanFilters,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements PictureOfTheDayEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
mixin _$PictureOfTheDayState {
  Set<PictureItem> get pictures => throw _privateConstructorUsedError;
  List<PictureItem> get filtredPictures => throw _privateConstructorUsedError;
  dynamic get filter => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  PictureFailure? get pictureFailure => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureOfTheDayStateCopyWith<PictureOfTheDayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureOfTheDayStateCopyWith<$Res> {
  factory $PictureOfTheDayStateCopyWith(PictureOfTheDayState value,
          $Res Function(PictureOfTheDayState) then) =
      _$PictureOfTheDayStateCopyWithImpl<$Res, PictureOfTheDayState>;
  @useResult
  $Res call(
      {Set<PictureItem> pictures,
      List<PictureItem> filtredPictures,
      dynamic filter,
      bool isLoading,
      PictureFailure? pictureFailure,
      int page});
}

/// @nodoc
class _$PictureOfTheDayStateCopyWithImpl<$Res,
        $Val extends PictureOfTheDayState>
    implements $PictureOfTheDayStateCopyWith<$Res> {
  _$PictureOfTheDayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictures = null,
    Object? filtredPictures = null,
    Object? filter = freezed,
    Object? isLoading = null,
    Object? pictureFailure = freezed,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      pictures: null == pictures
          ? _value.pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as Set<PictureItem>,
      filtredPictures: null == filtredPictures
          ? _value.filtredPictures
          : filtredPictures // ignore: cast_nullable_to_non_nullable
              as List<PictureItem>,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pictureFailure: freezed == pictureFailure
          ? _value.pictureFailure
          : pictureFailure // ignore: cast_nullable_to_non_nullable
              as PictureFailure?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureOfTheDayStateImplCopyWith<$Res>
    implements $PictureOfTheDayStateCopyWith<$Res> {
  factory _$$PictureOfTheDayStateImplCopyWith(_$PictureOfTheDayStateImpl value,
          $Res Function(_$PictureOfTheDayStateImpl) then) =
      __$$PictureOfTheDayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<PictureItem> pictures,
      List<PictureItem> filtredPictures,
      dynamic filter,
      bool isLoading,
      PictureFailure? pictureFailure,
      int page});
}

/// @nodoc
class __$$PictureOfTheDayStateImplCopyWithImpl<$Res>
    extends _$PictureOfTheDayStateCopyWithImpl<$Res, _$PictureOfTheDayStateImpl>
    implements _$$PictureOfTheDayStateImplCopyWith<$Res> {
  __$$PictureOfTheDayStateImplCopyWithImpl(_$PictureOfTheDayStateImpl _value,
      $Res Function(_$PictureOfTheDayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictures = null,
    Object? filtredPictures = null,
    Object? filter = freezed,
    Object? isLoading = null,
    Object? pictureFailure = freezed,
    Object? page = null,
  }) {
    return _then(_$PictureOfTheDayStateImpl(
      pictures: null == pictures
          ? _value._pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as Set<PictureItem>,
      filtredPictures: null == filtredPictures
          ? _value._filtredPictures
          : filtredPictures // ignore: cast_nullable_to_non_nullable
              as List<PictureItem>,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pictureFailure: freezed == pictureFailure
          ? _value.pictureFailure
          : pictureFailure // ignore: cast_nullable_to_non_nullable
              as PictureFailure?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PictureOfTheDayStateImpl implements _PictureOfTheDayState {
  const _$PictureOfTheDayStateImpl(
      {required final Set<PictureItem> pictures,
      required final List<PictureItem> filtredPictures,
      required this.filter,
      required this.isLoading,
      required this.pictureFailure,
      required this.page})
      : _pictures = pictures,
        _filtredPictures = filtredPictures;

  final Set<PictureItem> _pictures;
  @override
  Set<PictureItem> get pictures {
    if (_pictures is EqualUnmodifiableSetView) return _pictures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pictures);
  }

  final List<PictureItem> _filtredPictures;
  @override
  List<PictureItem> get filtredPictures {
    if (_filtredPictures is EqualUnmodifiableListView) return _filtredPictures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filtredPictures);
  }

  @override
  final dynamic filter;
  @override
  final bool isLoading;
  @override
  final PictureFailure? pictureFailure;
  @override
  final int page;

  @override
  String toString() {
    return 'PictureOfTheDayState(pictures: $pictures, filtredPictures: $filtredPictures, filter: $filter, isLoading: $isLoading, pictureFailure: $pictureFailure, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureOfTheDayStateImpl &&
            const DeepCollectionEquality().equals(other._pictures, _pictures) &&
            const DeepCollectionEquality()
                .equals(other._filtredPictures, _filtredPictures) &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.pictureFailure, pictureFailure) ||
                other.pictureFailure == pictureFailure) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pictures),
      const DeepCollectionEquality().hash(_filtredPictures),
      const DeepCollectionEquality().hash(filter),
      isLoading,
      pictureFailure,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureOfTheDayStateImplCopyWith<_$PictureOfTheDayStateImpl>
      get copyWith =>
          __$$PictureOfTheDayStateImplCopyWithImpl<_$PictureOfTheDayStateImpl>(
              this, _$identity);
}

abstract class _PictureOfTheDayState implements PictureOfTheDayState {
  const factory _PictureOfTheDayState(
      {required final Set<PictureItem> pictures,
      required final List<PictureItem> filtredPictures,
      required final dynamic filter,
      required final bool isLoading,
      required final PictureFailure? pictureFailure,
      required final int page}) = _$PictureOfTheDayStateImpl;

  @override
  Set<PictureItem> get pictures;
  @override
  List<PictureItem> get filtredPictures;
  @override
  dynamic get filter;
  @override
  bool get isLoading;
  @override
  PictureFailure? get pictureFailure;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$PictureOfTheDayStateImplCopyWith<_$PictureOfTheDayStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
