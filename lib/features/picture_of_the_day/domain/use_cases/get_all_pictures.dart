import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';
part 'get_all_pictures.freezed.dart';

@injectable
class GetAllPictures implements UseCase<PictureFailure, List<PictureItem>, Params> {
  static const int count = 10;
  final IPictureOfTheDayRepository repository;

  GetAllPictures(this.repository);

  @override
  Future<Either<PictureFailure, List<PictureItem>>> call(Params params) async {
    return await repository.getAllPictures(params.page, count);
  }
}

@freezed
class Params with _$Params {
  const factory Params({
    required int page,
  }) = _Params;
}
