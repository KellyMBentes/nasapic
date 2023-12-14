import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart' as get_all;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart' as search_by_date;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart' as search_by_title;
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';

@GenerateNiceMocks([MockSpec<get_all.GetAllPictures>()])
@GenerateNiceMocks([MockSpec<search_by_date.SearchPicturesByDate>()])
@GenerateNiceMocks([MockSpec<search_by_title.SearchPicturesByTitle>()])
import './picture_of_the_day_bloc_test.mocks.dart';

void main() {
  late get_all.GetAllPictures mockGetAllPictures;
  late search_by_date.SearchPicturesByDate mockSearchPicturesByDate;
  late search_by_title.SearchPicturesByTitle mockSearchPicturesByTitle;
  late PictureOfTheDayBloc bloc;

  setUp(() {
    mockGetAllPictures = MockGetAllPictures();
    mockSearchPicturesByDate = MockSearchPicturesByDate();
    mockSearchPicturesByTitle = MockSearchPicturesByTitle();
    bloc = PictureOfTheDayBloc(mockGetAllPictures, mockSearchPicturesByDate, mockSearchPicturesByTitle);
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
}
