import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

@injectable
class CleanCache implements UseCase<PictureFailure, void, NoParams> {
  final IPictureOfTheDayRepository repository;

  CleanCache(this.repository);

  @override
  Future<Either<PictureFailure, void>> call(NoParams noParams) async {
    return await repository.cleanCache();
  }
}
