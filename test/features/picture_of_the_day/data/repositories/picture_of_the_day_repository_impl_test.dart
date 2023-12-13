import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:nasapic/core/error/cache_exception.dart';
import 'package:nasapic/core/error/remote_exception.dart';
import 'package:nasapic/core/network/network_info.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart';
import 'package:nasapic/features/picture_of_the_day/data/repositories/picture_of_the_day_repository_impl.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

@GenerateNiceMocks([MockSpec<IPictureOfTheDayRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<IPictureOfTheDayLocalDataSource>()])
@GenerateNiceMocks([MockSpec<INetworkInfo>()])
import './picture_of_the_day_repository_impl_test.mocks.dart';

void main() {
  late IPictureOfTheDayRemoteDataSource mockRemoteDataSource;
  late IPictureOfTheDayLocalDataSource mockLocalDataSource;
  late INetworkInfo mockNetworkInfo;
  late IPictureOfTheDayRepository repository;

  setUp(() {
    mockRemoteDataSource = MockIPictureOfTheDayRemoteDataSource();
    mockLocalDataSource = MockIPictureOfTheDayLocalDataSource();
    mockNetworkInfo = MockINetworkInfo();
    repository =
        PictureOfTheDayRepositoryImpl(networkInfo: mockNetworkInfo, localDataSource: mockLocalDataSource, remoteDataSource: mockRemoteDataSource);
  });

  group('getAllPictures method', () {
    const int pageTest = 1;
    test('getAllPictures successfully retrieves pictures with internet', () async {
      const List<PictureItemModel> pictureModelListTest = [PictureItemModel(mediaType: '', date: '2023-12-08', explanation: '', title: '', url: '')];
      final List<PictureItem> pictureListTest = [PictureItem(date: DateTime.parse('2023-12-08'), explanation: '', title: '', imageUrl: '')];
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage)).thenAnswer((_) async => pictureModelListTest);
      when(mockLocalDataSource.savePictures(pictureModelListTest)).thenAnswer((_) async {});
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), true);
      expect(
        (result as Right<PictureFailure, List<PictureItem>>).value,
        pictureListTest,
      );
      verify(mockNetworkInfo.isConnected());
      verify(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verify(mockLocalDataSource.savePictures(pictureModelListTest));
    });
    test('getAllPictures returns cached pictures without internet', () async {
      const List<PictureItemModel> pictureModelListTest = [PictureItemModel(mediaType: '', date: '2023-12-08', explanation: '', title: '', url: '')];
      final List<PictureItem> pictureListTest = [PictureItem(date: DateTime.parse('2023-12-08'), explanation: '', title: '', imageUrl: '')];
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.getAllPictures()).thenAnswer((_) async => pictureModelListTest);
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), true);
      expect(
        (result as Right<PictureFailure, List<PictureItem>>).value,
        pictureListTest,
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verify(mockLocalDataSource.getAllPictures());
    });
    test('getAllPictures should return ServerFailure when remote datasource throws ServerException', () async {
      const mockedException = ServerException(code: null, message: 'Error');
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage)).thenThrow(mockedException);
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const ServerFailure(code: null, message: 'Error'),
      );
      verify(mockNetworkInfo.isConnected());
      verify(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verifyNever(mockLocalDataSource.getAllPictures());
    });
    test('getAllPictures should return UnknownFailure when remote datasource throws Exception', () async {
      final mockedException = Exception();
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage)).thenThrow(mockedException);
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const TypeMatcher<UnknownFailure>(),
      );
      verify(mockNetworkInfo.isConnected());
      verify(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verifyNever(mockLocalDataSource.getAllPictures());
    });
    test('getAllPictures should return CacheFailure when local datasource throws CacheException', () async {
      const mockedException = DatabaseException(message: 'Error');
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.getAllPictures()).thenThrow(mockedException);
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const CacheFailure(message: 'Error'),
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verify(mockLocalDataSource.getAllPictures());
    });
    test('getAllPictures should return NoValuesFoundeOnCachedFailure when cache returns empty list', () async {
      const List<PictureItemModel> picturesTest = [];
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.getAllPictures()).thenAnswer((_) async => picturesTest);
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const TypeMatcher<NoValuesFoundeOnCachedFailure>(),
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verify(mockLocalDataSource.getAllPictures());
    });
    test('getAllPictures should return UnknownFailure when local datasource throws Exception', () async {
      final mockedException = Exception();
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.getAllPictures()).thenThrow(mockedException);
      // act
      final result = await repository.getAllPictures(pageTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const TypeMatcher<UnknownFailure>(),
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.getAllPictures(pageTest, repository.countByPage));
      verify(mockLocalDataSource.getAllPictures());
    });
  });

  group('searchPictureByDate method', () {
    final DateTime dateTest = DateTime(2023, 12, 08);
    test('searchPictureByDate successfully retrieves pictures with internet', () async {
      const PictureItemModel pictureModelTest = PictureItemModel(mediaType: '', date: '2023-12-08', explanation: '', title: '', url: '');
      final PictureItem pictureTest = PictureItem(date: DateTime.parse('2023-12-08'), explanation: '', title: '', imageUrl: '');
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.searchPictureByDate(dateTest)).thenAnswer((_) async => pictureModelTest);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), true);
      expect(
        (result as Right<PictureFailure, PictureItem>).value,
        pictureTest,
      );
      verify(mockNetworkInfo.isConnected());
      verify(mockRemoteDataSource.searchPictureByDate(dateTest));
    });
    test('searchPictureByDate returns cached pictures without internet', () async {
      const PictureItemModel pictureModelTest = PictureItemModel(mediaType: '', date: '2023-12-08', explanation: '', title: '', url: '');
      final PictureItem pictureTest = PictureItem(date: DateTime.parse('2023-12-08'), explanation: '', title: '', imageUrl: '');
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.searchPictureByDate(dateTest)).thenAnswer((_) async => pictureModelTest);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), true);
      expect(
        (result as Right<PictureFailure, PictureItem>).value,
        pictureTest,
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.searchPictureByDate(dateTest));
      verify(mockLocalDataSource.searchPictureByDate(dateTest));
    });
    test('searchPictureByDate should return ServerFailure when remote datasource throws ServerException', () async {
      const mockedException = ServerException(code: null, message: 'Error');
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.searchPictureByDate(dateTest)).thenThrow(mockedException);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, PictureItem>).value,
        const ServerFailure(code: null, message: 'Error'),
      );
      verify(mockNetworkInfo.isConnected());
      verify(mockRemoteDataSource.searchPictureByDate(dateTest));
      verifyNever(mockLocalDataSource.searchPictureByDate(dateTest));
    });
    test('searchPictureByDate should return UnknownFailure when remote datasource throws Exception', () async {
      final mockedException = Exception();
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.searchPictureByDate(dateTest)).thenThrow(mockedException);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, PictureItem>).value,
        const TypeMatcher<UnknownFailure>(),
      );
      verify(mockNetworkInfo.isConnected());
      verify(mockRemoteDataSource.searchPictureByDate(dateTest));
      verifyNever(mockLocalDataSource.searchPictureByDate(dateTest));
    });
    test('searchPictureByDate should return CacheFailure when local datasource throws CacheException', () async {
      const mockedException = DatabaseException(message: 'Error');
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.searchPictureByDate(dateTest)).thenThrow(mockedException);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, PictureItem>).value,
        const CacheFailure(message: 'Error'),
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.searchPictureByDate(dateTest));
      verify(mockLocalDataSource.searchPictureByDate(dateTest));
    });
    test('searchPictureByDate should return NoValuesFoundeOnCachedFailure when cache returns empty list', () async {
      final mockedException = NoValuesFoundedOnCacheException();
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.searchPictureByDate(dateTest)).thenThrow(mockedException);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, PictureItem>).value,
        const TypeMatcher<NoValuesFoundeOnCachedFailure>(),
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.searchPictureByDate(dateTest));
      verify(mockLocalDataSource.searchPictureByDate(dateTest));
    });
    test('searchPictureByDate should return UnknownFailure when local datasource throws Exception', () async {
      final mockedException = Exception();
      // arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      when(mockLocalDataSource.searchPictureByDate(dateTest)).thenThrow(mockedException);
      // act
      final result = await repository.searchPictureByDate(dateTest);
      // assert
      expect(result.isRight(), false);
      expect(
        (result as Left<PictureFailure, PictureItem>).value,
        const TypeMatcher<UnknownFailure>(),
      );
      verify(mockNetworkInfo.isConnected());
      verifyNever(mockRemoteDataSource.searchPictureByDate(dateTest));
      verify(mockLocalDataSource.searchPictureByDate(dateTest));
    });
  });
}
