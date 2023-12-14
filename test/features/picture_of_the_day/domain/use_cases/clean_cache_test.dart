// ignore_for_file: void_checks

import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/clean_cache.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateNiceMocks([MockSpec<IPictureOfTheDayRepository>()])
import './clean_cache_test.mocks.dart';

void main() {
  late IPictureOfTheDayRepository mockPictureOfTheDayRepository;
  late CleanCache useCase;

  setUp(() {
    mockPictureOfTheDayRepository = MockIPictureOfTheDayRepository();
    useCase = CleanCache(mockPictureOfTheDayRepository);
  });

  group('cleanCache useCase', () {
    test(
      "should call cleanCache from pictureOfTheDayRepo",
      () async {
        // arrange
        when(mockPictureOfTheDayRepository.cleanCache()).thenAnswer((_) async => const Right(Void));
        // act
        await useCase(const NoParams());
        // assert
        verify(mockPictureOfTheDayRepository.cleanCache()).called(1);
      },
    );
    test(
      "should get right value when repository returns success",
      () async {
        // arrange
        when(mockPictureOfTheDayRepository.cleanCache()).thenAnswer((_) async => const Right(Void));
        // act
        final result = await useCase(const NoParams());
        // assert
        expect(result, const Right(Void));
      },
    );
  });
}
