import 'package:dartz/dartz.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

void main() {
  late SearchPicturesByTitle useCase;
  late DateTime date;

  setUp(() {
    useCase = SearchPicturesByTitle();
    date = DateTime(2013, 12, 1);
  });

  group('searchPicturesByTitle useCase', () {
    test('SearchPicturesByTitle successfully filters pictures', () async {
      // arrange
      final pictureList = [
        PictureItem(title: 'The Sun', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'The Sunday', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'Earth from Space', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'Jupiter', date: date, explanation: '', imageUrl: ''),
      ];
      const title = 'Sun';
      // act
      final result = await useCase(Params(title: title, pictures: pictureList));
      // assert
      expect(result.isRight(), true);
      expect(
        (result as Right<PictureFailure, List<PictureItem>>).value,
        [
          PictureItem(title: 'The Sun', date: date, explanation: '', imageUrl: ''),
          PictureItem(title: 'The Sunday', date: date, explanation: '', imageUrl: ''),
        ],
      );
    });
    test('SearchPicturesByTitle successfully filters pictures with diferent cases', () async {
      // arrange
      final pictureList = [
        PictureItem(title: 'THE SUN', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'THE SUNDAY', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'Earth from Space', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'Jupiter', date: date, explanation: '', imageUrl: ''),
      ];
      const title = 'Sun';
      // act
      final result = await useCase(Params(title: title, pictures: pictureList));
      // assert
      expect(result.isRight(), true);
      expect(
        (result as Right<PictureFailure, List<PictureItem>>).value,
        [
          PictureItem(title: 'THE SUN', date: date, explanation: '', imageUrl: ''),
          PictureItem(title: 'THE SUNDAY', date: date, explanation: '', imageUrl: ''),
        ],
      );
    });
    test('SearchPicturesByTitle returns NoValuesFoundeOnMemoryFailure when no pictures match', () async {
      // arrange
      final pictureList = [
        PictureItem(title: 'The Sun', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'The Sunday', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'Earth from Space', date: date, explanation: '', imageUrl: ''),
        PictureItem(title: 'Jupiter', date: date, explanation: '', imageUrl: ''),
      ];
      const title = 'Moon';
      // act
      final result = await useCase(Params(title: title, pictures: pictureList));
      // assert
      expect(result.isLeft(), true);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const TypeMatcher<NoValuesFoundeOnMemoryFailure>(),
      );
    });
    test('SearchPicturesByTitle returns NoValuesFoundeOnMemoryFailure when pictures list is empty', () async {
      // arrange
      final List<PictureItem> pictureList = [];
      const title = 'Moon';
      // act
      final result = await useCase(Params(title: title, pictures: pictureList));
      // assert
      expect(result.isLeft(), true);
      expect(
        (result as Left<PictureFailure, List<PictureItem>>).value,
        const TypeMatcher<NoValuesFoundeOnMemoryFailure>(),
      );
    });
  });
}
