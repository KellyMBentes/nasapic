import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'picture_failure.freezed.dart';

sealed class PictureFailure {}

@freezed
class CacheFailure extends PictureFailure with _$CacheFailure {
  const factory CacheFailure({
    required String message,
  }) = _CacheFailure;
}

@freezed
class ServerFailure extends PictureFailure with _$ServerFailure {
  const factory ServerFailure({
    required int? code,
    required String message,
  }) = _ServerFailure;
}

class NoValuesFoundeOnCachedFailure extends PictureFailure {}

class NoValuesFoundeOnMemoryFailure extends PictureFailure {}

class UnknownFailure extends PictureFailure {}
