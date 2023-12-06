// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart'
    as _i9;
import 'package:nasapic/features/picture_of_the_day/data/repositories/demo_picture_of_the_day_repository.dart'
    as _i4;
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart'
    as _i3;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart'
    as _i8;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart'
    as _i5;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart'
    as _i6;
import 'package:nasapic/injection.dart' as _i10;

const String _demo = 'demo';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i3.IPictureOfTheDayRepository>(
      () => _i4.DemoPictureOfTheDayRepository(),
      registerFor: {_demo},
    );
    gh.factory<_i5.SearchPicturesByDate>(
        () => _i5.SearchPicturesByDate(gh<_i3.IPictureOfTheDayRepository>()));
    gh.factory<_i6.SearchPicturesByTitle>(
        () => _i6.SearchPicturesByTitle(gh<_i3.IPictureOfTheDayRepository>()));
    gh.factory<String>(
      () => dioModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => dioModule.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i7.Dio>(() => dioModule.dio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.factory<_i8.GetAllPictures>(
        () => _i8.GetAllPictures(gh<_i3.IPictureOfTheDayRepository>()));
    gh.factory<_i9.PictureOfTheDayRemoteDataSourceImpl>(
        () => _i9.PictureOfTheDayRemoteDataSourceImpl(dio: gh<_i7.Dio>()));
    return this;
  }
}

class _$DioModule extends _i10.DioModule {}
