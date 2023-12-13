// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasapic/core/data/hive_database.dart' as _i4;
import 'package:nasapic/core/network/network_info.dart' as _i12;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart'
    as _i5;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart'
    as _i13;
import 'package:nasapic/features/picture_of_the_day/data/repositories/demo_picture_of_the_day_repository.dart'
    as _i7;
import 'package:nasapic/features/picture_of_the_day/data/repositories/picture_of_the_day_repository_impl.dart'
    as _i14;
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart'
    as _i6;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart'
    as _i11;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart'
    as _i8;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart'
    as _i9;
import 'package:nasapic/injection.dart' as _i15;

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
    final externalModule = _$ExternalModule();
    await gh.lazySingletonAsync<_i3.Connectivity>(
      () => externalModule.connectivity(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.IHiveDatabase>(
      () => externalModule.hiveDatabase(),
      preResolve: true,
    );
    gh.factory<_i5.IPictureOfTheDayLocalDataSource>(
      () => _i5.PictureOfTheDayLocalDataSourceImpl(gh<_i4.IHiveDatabase>()),
      registerFor: {_dev},
    );
    gh.factory<_i6.IPictureOfTheDayRepository>(
      () => _i7.DemoPictureOfTheDayRepository(),
      registerFor: {_demo},
    );
    gh.factory<_i8.SearchPicturesByDate>(
        () => _i8.SearchPicturesByDate(gh<_i6.IPictureOfTheDayRepository>()));
    gh.factory<_i9.SearchPicturesByTitle>(() => _i9.SearchPicturesByTitle());
    gh.factory<String>(
      () => externalModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<String>(
      () => externalModule.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i10.Dio>(() => externalModule.dio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.factory<_i11.GetAllPictures>(
        () => _i11.GetAllPictures(gh<_i6.IPictureOfTheDayRepository>()));
    gh.factory<_i12.INetworkInfo>(() => _i12.NetworkInfoImpl(
          connectivity: gh<_i3.Connectivity>(),
          dio: gh<_i10.Dio>(),
        ));
    gh.factory<_i13.IPictureOfTheDayRemoteDataSource>(
      () => _i13.PictureOfTheDayRemoteDataSourceImpl(gh<_i10.Dio>()),
      registerFor: {_dev},
    );
    gh.factory<_i6.IPictureOfTheDayRepository>(
      () => _i14.PictureOfTheDayRepositoryImpl(
        networkInfo: gh<_i12.INetworkInfo>(),
        localDataSource: gh<_i5.IPictureOfTheDayLocalDataSource>(),
        remoteDataSource: gh<_i13.IPictureOfTheDayRemoteDataSource>(),
      ),
      registerFor: {_dev},
    );
    return this;
  }
}

class _$ExternalModule extends _i15.ExternalModule {}
