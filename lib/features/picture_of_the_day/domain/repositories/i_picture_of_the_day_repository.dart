import 'package:dartz/dartz.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

abstract class IPictureOfTheDayRepository {
  Future<Either<PictureFailure, List<PictureItem>>> getAllPictures();
  Future<Either<PictureFailure, List<PictureItem>>> searchPictureByTitle(String title);
  Future<Either<PictureFailure, PictureItem>> searchPictureByDate(DateTime date);
}
