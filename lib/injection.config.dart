// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasapic/core/data/hive_database.dart' as _i3;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart'
    as _i4;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart'
    as _i11;
import 'package:nasapic/features/picture_of_the_day/data/repositories/demo_picture_of_the_day_repository.dart'
    as _i6;
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart'
    as _i5;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart'
    as _i10;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart'
    as _i7;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart'
    as _i8;
import 'package:nasapic/injection.dart' as _i12;

const String _dev = 'dev';
const String _demo = 'demo';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    await gh.lazySingletonAsync<_i3.IHiveDatabase>(
      () => dioModule.hiveDatabase(),
      preResolve: true,
    );
    gh.factory<_i4.IPictureOfTheDayLocalDataSource>(
      () => _i4.PictureOfTheDayLocalDataSource(gh<_i3.IHiveDatabase>()),
      registerFor: {_dev},
    );
    gh.factory<_i5.IPictureOfTheDayRepository>(
      () => _i6.DemoPictureOfTheDayRepository(),
      registerFor: {_demo},
    );
    gh.factory<_i7.SearchPicturesByDate>(
        () => _i7.SearchPicturesByDate(gh<_i5.IPictureOfTheDayRepository>()));
    gh.factory<_i8.SearchPicturesByTitle>(
        () => _i8.SearchPicturesByTitle(gh<_i5.IPictureOfTheDayRepository>()));
    gh.factory<String>(
      () => dioModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => dioModule.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i9.Dio>(() => dioModule.dio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.factory<_i10.GetAllPictures>(
        () => _i10.GetAllPictures(gh<_i5.IPictureOfTheDayRepository>()));
    gh.factory<_i11.IPictureOfTheDayRemoteDataSource>(
      () => _i11.PictureOfTheDayRemoteDataSourceImpl(gh<_i9.Dio>()),
      registerFor: {_dev},
    );
    return this;
  }
}

class _$DioModule extends _i12.DioModule {}
