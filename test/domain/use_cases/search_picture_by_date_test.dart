import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

@GenerateNiceMocks([MockSpec<IPictureOfTheDayRepository>()])
import './get_all_pictures_test.mocks.dart';

void main() {
  late IPictureOfTheDayRepository mockPictureOfTheDayRepository;
  late SearchPicturesByDate useCase;

  setUp(() {
    mockPictureOfTheDayRepository = MockIPictureOfTheDayRepository();
    useCase = SearchPicturesByDate(mockPictureOfTheDayRepository);
  });

  final List<PictureItem> pictures = [
    PictureItem(
      date: DateTime(2020, 11, 15),
      explanation:
          'Why is this galaxy so thin?  Many disk galaxies are just as thin as NGC 5866, pictured here, but are not seen edge-on from our vantage point.  One galaxy that is situated edge-on is our own Milky Way Galaxy.  Classified as a lenticular galaxy, NGC 5866 has numerous and complex dust lanes appearing dark and red, while many of the bright stars in the disk give it a more blue underlying hue.  The blue disk of young stars can be seen extending past the dust in the extremely thin galactic plane, while the bulge in the disk center appears tinged more orange from the older and redder stars that likely exist there. Although similar in mass to our Milky Way Galaxy, light takes about 60,000 years to cross NGC 5866, about 30 percent less than light takes to cross our own Galaxy. In general, many disk galaxies are very thin because the gas that formed them collided with itself as it rotated about the gravitational center. Galaxy NGC 5866 lies about 44 million light years distant toward the constellation of the Dragon (Draco).    Almost Hyperspace: Random APOD Generator',
      title: 'Edge-On Galaxy NGC 5866',
      imageUrl: 'https://apod.nasa.gov/apod/image/2011/ngc5866_hst_960.jpg',
    ),
    PictureItem(
      date: DateTime(2022, 06, 26),
      explanation:
          'What caused this outburst of V838 Mon?  For reasons unknown, star V838 Mon\'s outer surface suddenly greatly expanded with the result that it became one of the brighter stars in the  Milky Way Galaxy in early 2002.  Then, just as suddenly, it shrunk and faded.  A stellar flash like this had never been seen before -- supernovas and novas expel matter out into space.  Although the V838 Mon flash appears to expel material into space, what is seen in the featured image from the Hubble Space Telescope is actually an outwardly expanding light echo of the original flash.  In a light echo, light from the flash is reflected by successively more distant surfaces in the complex array of ambient interstellar dust that already surrounded the star.  V838 Mon lies about 20,000 light years away toward the constellation of the unicorn (Monoceros), while the light echo above spans about six light years in diameter.',
      title: 'Light Echoes from V838 Mon',
      imageUrl: 'https://apod.nasa.gov/apod/image/2206/V838Mon_Hubble_960.jpg',
    ),
  ];

  DateTime mockedDate = DateTime(2023);
  Params mockedParams = Params(date: mockedDate);
  PictureFailure mockedFailure = ServerUnavaiableFailure();

  group('searchPicturesByDate useCase', () {
    test(
      "should call searchPicturesByDate from pictureOfTheDayRepo",
      () async {
        // arrange
        when(mockPictureOfTheDayRepository.searchPictureByDate(mockedDate)).thenAnswer((_) async => Right(pictures));
        // act
        await useCase(mockedParams);
        // assert
        verify(mockPictureOfTheDayRepository.searchPictureByDate(mockedDate)).called(1);
      },
    );
    test(
      "should get picture list when repository returns success",
      () async {
        // arrange
        when(mockPictureOfTheDayRepository.searchPictureByDate(mockedDate)).thenAnswer((_) async => Right(pictures));
        // act
        final result = await useCase(mockedParams);
        // assert
        expect(result, Right(pictures));
      },
    );

    test(
      'should return a PictureFailure when the call to the repository is unsuccessful',
      () async {
        // arrange
        when(mockPictureOfTheDayRepository.searchPictureByDate(mockedDate)).thenAnswer((_) async => Left(mockedFailure));
        // act
        final result = await useCase(mockedParams);
        // assert
        expect(result, Left(mockedFailure));
      },
    );
  });
}
