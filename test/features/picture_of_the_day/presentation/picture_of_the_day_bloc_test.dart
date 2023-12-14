// ignore_for_file: void_checks

import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/clean_cache.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart' as get_all;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart' as search_by_date;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart' as search_by_title;
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';

@GenerateNiceMocks([MockSpec<get_all.GetAllPictures>()])
@GenerateNiceMocks([MockSpec<search_by_date.SearchPicturesByDate>()])
@GenerateNiceMocks([MockSpec<search_by_title.SearchPicturesByTitle>()])
@GenerateNiceMocks([MockSpec<CleanCache>()])
import './picture_of_the_day_bloc_test.mocks.dart';

void main() {
  late get_all.GetAllPictures mockGetAllPictures;
  late search_by_date.SearchPicturesByDate mockSearchPicturesByDate;
  late search_by_title.SearchPicturesByTitle mockSearchPicturesByTitle;
  late CleanCache mockCleanCache;
  late PictureOfTheDayBloc bloc;

  setUp(() {
    mockGetAllPictures = MockGetAllPictures();
    mockSearchPicturesByDate = MockSearchPicturesByDate();
    mockSearchPicturesByTitle = MockSearchPicturesByTitle();
    mockCleanCache = MockCleanCache();
    bloc = PictureOfTheDayBloc(mockGetAllPictures, mockSearchPicturesByDate, mockSearchPicturesByTitle, mockCleanCache);
  });

  tearDown(() => bloc.close());

  group('getAllPictures event', () {
    const int pageTest = 1;
    final PictureItem pictureTest = PictureItem(date: DateTime(2023, 12, 08), explanation: '', title: '', imageUrl: '');
    const PictureFailure pictureFailureTest = ServerFailure(code: 500, message: 'Internal Server Error');
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, loaded] when getAllPictures is added and successfully loads pictures.',
      setUp: () {
        when(mockGetAllPictures(const get_all.Params(page: pageTest))).thenAnswer((_) async => Right([pictureTest]));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const PictureOfTheDayEvent.getAllPictures(pageTest)),
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {pictureTest}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: null, page: pageTest),
      ],
      verify: (bloc) {
        verify(mockGetAllPictures(const get_all.Params(page: pageTest))).called(1);
      },
    );
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, loaded] when getAllPictures is added more than once with the same page number.',
      setUp: () {
        when(mockGetAllPictures(const get_all.Params(page: pageTest))).thenAnswer((_) async => Right([pictureTest]));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(const PictureOfTheDayEvent.getAllPictures(pageTest));
        bloc.add(const PictureOfTheDayEvent.getAllPictures(pageTest));
        bloc.add(const PictureOfTheDayEvent.getAllPictures(pageTest));
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {pictureTest}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: null, page: pageTest),
      ],
      verify: (bloc) {
        verify(mockGetAllPictures(const get_all.Params(page: pageTest))).called(1);
      },
    );
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, failure] when getAllPictures is added and received error from use case.',
      setUp: () {
        when(mockGetAllPictures(const get_all.Params(page: pageTest))).thenAnswer((_) async => const Left(pictureFailureTest));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const PictureOfTheDayEvent.getAllPictures(pageTest)),
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: pictureFailureTest, page: 0),
      ],
      verify: (bloc) {
        verify(mockGetAllPictures(const get_all.Params(page: pageTest))).called(1);
      },
    );
  });

  group('searchPicturesByTitle event', () {
    const int pageTest = 1;
    final PictureItem pictureTest = PictureItem(date: DateTime(2023, 12, 08), explanation: '', title: 'Test title', imageUrl: '');
    const String titleTest = 'test';
    final PictureFailure pictureFailureTest = NoValuesFoundeOnMemoryFailure();

    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, loaded] when searchPicturesByTitle is added and successfully loads pictures.',
      setUp: () {
        when(mockGetAllPictures(const get_all.Params(page: pageTest))).thenAnswer((_) async => Right([pictureTest]));
        when(mockSearchPicturesByTitle(search_by_title.Params(title: titleTest, pictures: [pictureTest])))
            .thenAnswer((_) async => Right([pictureTest]));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(const PictureOfTheDayEvent.getAllPictures(pageTest));
        bloc.add(const PictureOfTheDayEvent.searchPicturesByTitle(titleTest));
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {pictureTest}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: null, page: pageTest),
        PictureOfTheDayState(pictures: {pictureTest}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: pageTest),
        PictureOfTheDayState(
            pictures: {pictureTest}, filtredPictures: [pictureTest], filter: titleTest, isLoading: false, pictureFailure: null, page: 1),
      ],
      verify: (bloc) {
        verify(mockSearchPicturesByTitle(search_by_title.Params(title: titleTest, pictures: [pictureTest]))).called(1);
      },
    );
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, failure] when searchPicturesByTitle is added and received error from use case.',
      setUp: () {
        when(mockSearchPicturesByTitle(const search_by_title.Params(title: titleTest, pictures: [])))
            .thenAnswer((_) async => Left(pictureFailureTest));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(const PictureOfTheDayEvent.searchPicturesByTitle(titleTest));
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: titleTest, isLoading: false, pictureFailure: pictureFailureTest, page: 0),
      ],
      verify: (bloc) {
        verify(mockSearchPicturesByTitle(const search_by_title.Params(title: titleTest, pictures: []))).called(1);
      },
    );
  });

  group('searchPicturesByDate event', () {
    final PictureItem pictureTest = PictureItem(date: DateTime(2023, 12, 08), explanation: '', title: 'Test title', imageUrl: '');
    final DateTime dateTest = DateTime.now();
    const PictureFailure pictureFailureTest = ServerFailure(code: 500, message: 'Internal Server Error');
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, loaded] when searchPicturesByDate is added and successfully loads pictures.',
      setUp: () {
        when(mockSearchPicturesByDate(search_by_date.Params(date: dateTest))).thenAnswer((_) async => Right(pictureTest));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(PictureOfTheDayEvent.searchPicturesByDate(dateTest));
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {}, filtredPictures: [pictureTest], filter: dateTest, isLoading: false, pictureFailure: null, page: 0),
      ],
      verify: (bloc) {
        verify(mockSearchPicturesByDate(search_by_date.Params(date: dateTest))).called(1);
      },
    );
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, failure] when searchPicturesByDate is added and received error from use case.',
      setUp: () {
        when(mockSearchPicturesByDate(search_by_date.Params(date: dateTest))).thenAnswer((_) async => const Left(pictureFailureTest));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(PictureOfTheDayEvent.searchPicturesByDate(dateTest));
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: dateTest, isLoading: false, pictureFailure: pictureFailureTest, page: 0),
      ],
      verify: (bloc) {
        verify(mockSearchPicturesByDate(search_by_date.Params(date: dateTest))).called(1);
      },
    );
  });

  group('cleanFilters event', () {
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loaded] cleaning all filters after add cleanFilters event.',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const PictureOfTheDayEvent.cleanFilters());
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: null, page: 0),
      ],
    );
  });

  group('refresh event', () {
    const PictureFailure pictureFailureTest = CacheFailure(message: 'Cache Failure');
    const int pageTest = 1;
    final PictureItem pictureTest = PictureItem(date: DateTime(2023, 12, 08), explanation: '', title: 'Test title', imageUrl: '');
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, loaded] when refresh is added and successfully loads pictures.',
      setUp: () {
        when(mockGetAllPictures(const get_all.Params(page: pageTest))).thenAnswer((_) async => Right([pictureTest]));
        when(mockCleanCache(const NoParams())).thenAnswer((_) async => const Right(Void));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(const PictureOfTheDayEvent.refresh());
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        PictureOfTheDayState(pictures: {pictureTest}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: null, page: pageTest),
      ],
      verify: (bloc) {
        verify(mockCleanCache(const NoParams())).called(1);
        verify(mockGetAllPictures(const get_all.Params(page: pageTest))).called(1);
      },
    );
    blocTest<PictureOfTheDayBloc, PictureOfTheDayState>(
      'emits [loading, failure] when refresh is added and received error from use case.',
      setUp: () {
        when(mockCleanCache(const NoParams())).thenAnswer((_) async => const Left(pictureFailureTest));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(const PictureOfTheDayEvent.refresh());
      },
      expect: () => [
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: true, pictureFailure: null, page: 0),
        const PictureOfTheDayState(pictures: {}, filtredPictures: [], filter: null, isLoading: false, pictureFailure: pictureFailureTest, page: 0),
      ],
      verify: (bloc) {
        verify(mockCleanCache(const NoParams())).called(1);
      },
    );
  });
}
