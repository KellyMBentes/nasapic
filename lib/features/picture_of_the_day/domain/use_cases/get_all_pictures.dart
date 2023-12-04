import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

@injectable
class GetAllPictures implements UseCase<PictureFailure, List<PictureItem>, NoParams> {
  final IPictureOfTheDayRepository repository;

  GetAllPictures(this.repository);

  @override
  Future<Either<PictureFailure, List<PictureItem>>> call(NoParams params) async {
    return await repository.getAllPictures();
  }
}
