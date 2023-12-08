import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';
part 'search_picture_by_date.freezed.dart';

@injectable
class SearchPicturesByDate implements UseCase<PictureFailure, PictureItem, Params> {
  final IPictureOfTheDayRepository repository;

  SearchPicturesByDate(this.repository);

  @override
  Future<Either<PictureFailure, PictureItem>> call(Params params) async {
    return await repository.searchPictureByDate(params.date);
  }
}

@freezed
class Params with _$Params {
  const factory Params({
    required DateTime date,
  }) = _Params;
}
