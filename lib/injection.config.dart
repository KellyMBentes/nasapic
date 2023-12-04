// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasapic/features/picture_of_the_day/data/repositories/demo_picture_of_the_day_repository.dart'
    as _i4;
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart'
    as _i3;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart'
    as _i7;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart'
    as _i5;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart'
    as _i6;

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
    gh.factory<_i3.IPictureOfTheDayRepository>(
      () => _i4.DemoPictureOfTheDayRepository(),
      registerFor: {_demo},
    );
    gh.factory<_i5.SearchPicturesByDate>(
        () => _i5.SearchPicturesByDate(gh<_i3.IPictureOfTheDayRepository>()));
    gh.factory<_i6.SearchPicturesByTitle>(
        () => _i6.SearchPicturesByTitle(gh<_i3.IPictureOfTheDayRepository>()));
    gh.factory<_i7.GetAllPictures>(
        () => _i7.GetAllPictures(gh<_i3.IPictureOfTheDayRepository>()));
    return this;
  }
}
