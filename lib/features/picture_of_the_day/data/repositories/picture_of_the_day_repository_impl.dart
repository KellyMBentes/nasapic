import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/error/cache_exception.dart';
import 'package:nasapic/core/error/remote_exception.dart';
import 'package:nasapic/core/network/network_info.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';
import 'package:nasapic/injection.dart';

@Injectable(as: IPictureOfTheDayRepository, env: [Env.dev])
class PictureOfTheDayRepositoryImpl extends IPictureOfTheDayRepository {
  final INetworkInfo networkInfo;
  final IPictureOfTheDayLocalDataSource localDataSource;
  final IPictureOfTheDayRemoteDataSource remoteDataSource;

  PictureOfTheDayRepositoryImpl({required this.networkInfo, required this.localDataSource, required this.remoteDataSource});

  @override
  int get countByPage => 20;

  @override
  Future<Either<PictureFailure, List<PictureItem>>> getAllPictures(int page) async {
    final isConnected = await networkInfo.isConnected();
    try {
      if (isConnected) {
        final picturesModel = await remoteDataSource.getAllPictures(page, countByPage);
        await localDataSource.savePictures(picturesModel);
        return Right(picturesModel.map((pictureModel) => pictureModel.toEntity()).toList());
      } else {
        final cachedPictures = await localDataSource.getAllPictures();
        if (cachedPictures.isEmpty) {
          return Left(NoValuesFoundeOnCachedFailure());
        } else {
          return Right(cachedPictures.map((pictureModel) => pictureModel.toEntity()).toList());
        }
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on DatabaseException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on NoValuesFoundedOnCacheException {
      return Left(NoValuesFoundeOnCachedFailure());
    } on Exception {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<PictureFailure, PictureItem>> searchPictureByDate(DateTime date) async {
    final isConnected = await networkInfo.isConnected();
    try {
      if (isConnected) {
        final picturesModel = await remoteDataSource.searchPictureByDate(date);
        return Right(picturesModel.toEntity());
      } else {
        final cachedPicture = await localDataSource.searchPictureByDate(date);
        return Right(cachedPicture.toEntity());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on DatabaseException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on NoValuesFoundedOnCacheException {
      return Left(NoValuesFoundeOnCachedFailure());
    } on Exception {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<PictureFailure, void>> cleanCache() async {
    try {
      return Right(await localDataSource.cleanCache());
    } on DatabaseException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on Exception {
      return Left(UnknownFailure());
    }
  }
}
