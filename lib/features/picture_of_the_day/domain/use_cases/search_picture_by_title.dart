import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';
part 'search_picture_by_title.freezed.dart';

@injectable
class SearchPicturesByTitle implements UseCase<PictureFailure, List<PictureItem>, Params> {
  @override
  Future<Either<PictureFailure, List<PictureItem>>> call(Params params) async {
    List<PictureItem> filteredList = params.pictures.where((item) => item.title.toLowerCase().contains(params.title.toLowerCase())).toList();
    if (filteredList.isEmpty) return Left(NoValuesFoundeOnMemoryFailure());
    return Right(filteredList);
  }
}

@freezed
class Params with _$Params {
  const factory Params({required String title, required List<PictureItem> pictures}) = _Params;
}
