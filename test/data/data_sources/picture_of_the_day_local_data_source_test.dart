import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasapic/core/data/hive_database.dart';
import 'package:nasapic/core/error/cache_exception.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/hive_box_type.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart';

@GenerateNiceMocks([MockSpec<IHiveDatabase>()])
@GenerateNiceMocks([MockSpec<Box>()])
import './picture_of_the_day_local_data_source_test.mocks.dart';

void main() {
  late IPictureOfTheDayLocalDataSource localDataSource;
  late IHiveDatabase mockDatabase;
  late Box mockedBox;

  setUp(() {
    mockDatabase = MockIHiveDatabase();
    localDataSource = PictureOfTheDayLocalDataSource(mockDatabase);
    mockedBox = MockBox();
  });

  const String errorMessage = "Error";
  const DatabaseException mockedException = DatabaseException(message: errorMessage);
  final mockedHiveError = HiveError(errorMessage);
  const List<dynamic> mockedResultMap = [
    {
      "copyright": "Jeff Dai",
      "date": "2023-12-02",
      "explanation":
          "You can take a subway ride to visit this observatory in Beijing, China but you won't find any telescopes there. Starting in the 1400s astronomers erected devices at the Beijing Ancient Observatory site to enable them to accurately measure and track the positions of naked-eye stars and planets. Some of the large, ornate astronomical instruments are still standing. You can even see stars from the star observation platform today, but now only the very brightest celestial beacons are visible against the city lights. In this time series of exposures from a camera fixed to a tripod to record graceful arcing startrails, the brightest trail is actually the Moon. Its broad arc is seen behind the ancient observatory's brass armillary sphere. Compare this picture from the Beijing Ancient Observatory taken in September 2023 to one taken in 1895.",
      "hdurl": "https://apod.nasa.gov/apod/image/2312/StartrailsBeijingAncientObservatory-3.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Startrails over Beijing Ancient Observatory",
      "url": "https://apod.nasa.gov/apod/image/2312/StartrailsBeijingAncientObservatory-3_1024.jpg"
    },
    {
      "copyright": "El Cielo de Canarias",
      "date": "2023-12-03",
      "explanation":
          "These people are not in danger. What is coming down from the left is just the Moon, far in the distance. Luna appears so large here because she is being photographed through a telescopic lens.  What is moving is mostly the Earth, whose spin causes the Moon to slowly disappear behind Mount Teide, a volcano in the Canary Islands off the northwest coast of Africa. The people pictured are 16 kilometers away and  many are facing the camera because they are watching the Sun rise behind the photographer. It is not a coincidence that a full moon rises just when the Sun sets because the Sun is always on the opposite side of the sky from a full moon. The featured video was made in 2018 during the full Milk Moon.  The video is not time-lapse -- this was really how fast the Moon was setting.",
      "media_type": "video",
      "service_version": "v1",
      "thumbnail_url": "https://img.youtube.com/vi/afHfMMC-MJE/0.jpg",
      "title": "Moon Setting Behind Teide Volcano",
      "url": "https://www.youtube.com/embed/afHfMMC-MJE?rel=0"
    },
  ];
  const List<PictureItemModel> mockedResult = [
    PictureItemModel(
      mediaType: "image",
      date: "2023-12-02",
      explanation:
          "You can take a subway ride to visit this observatory in Beijing, China but you won't find any telescopes there. Starting in the 1400s astronomers erected devices at the Beijing Ancient Observatory site to enable them to accurately measure and track the positions of naked-eye stars and planets. Some of the large, ornate astronomical instruments are still standing. You can even see stars from the star observation platform today, but now only the very brightest celestial beacons are visible against the city lights. In this time series of exposures from a camera fixed to a tripod to record graceful arcing startrails, the brightest trail is actually the Moon. Its broad arc is seen behind the ancient observatory's brass armillary sphere. Compare this picture from the Beijing Ancient Observatory taken in September 2023 to one taken in 1895.",
      title: "Startrails over Beijing Ancient Observatory",
      url: "https://apod.nasa.gov/apod/image/2312/StartrailsBeijingAncientObservatory-3_1024.jpg",
      thumbnailUrl: null,
      copyright: "Jeff Dai",
    ),
    PictureItemModel(
      mediaType: "video",
      date: "2023-12-03",
      explanation:
          "These people are not in danger. What is coming down from the left is just the Moon, far in the distance. Luna appears so large here because she is being photographed through a telescopic lens.  What is moving is mostly the Earth, whose spin causes the Moon to slowly disappear behind Mount Teide, a volcano in the Canary Islands off the northwest coast of Africa. The people pictured are 16 kilometers away and  many are facing the camera because they are watching the Sun rise behind the photographer. It is not a coincidence that a full moon rises just when the Sun sets because the Sun is always on the opposite side of the sky from a full moon. The featured video was made in 2018 during the full Milk Moon.  The video is not time-lapse -- this was really how fast the Moon was setting.",
      title: "Moon Setting Behind Teide Volcano",
      url: "https://www.youtube.com/embed/afHfMMC-MJE?rel=0",
      thumbnailUrl: "https://img.youtube.com/vi/afHfMMC-MJE/0.jpg",
      copyright: "El Cielo de Canarias",
    )
  ];
  group('getAllPictures', () {
    test('should return a list of PictureItemModels from Hive', () async {
      // arrange
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenAnswer((_) async => mockedBox);
      when(mockedBox.values).thenReturn(mockedResultMap);
      // act
      final result = await localDataSource.getAllPictures();
      // ssert
      expect(result, mockedResult);
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
      verify(mockedBox.values);
    });

    test('should throw a DatabaseException when Hive throws an error', () async {
      // arrange
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenThrow(mockedHiveError);
      // act
      try {
        await localDataSource.getAllPictures();
      } catch (e) {
        //assert
        expect(e, mockedException);
      }
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
    });
  });

  group('savePictures', () {
    const Map<dynamic, Map<String, dynamic>> dateWithPictureItemMap = {
      "2023-12-02": {
        "copyright": "Jeff Dai",
        "date": "2023-12-02",
        "explanation":
            "You can take a subway ride to visit this observatory in Beijing, China but you won't find any telescopes there. Starting in the 1400s astronomers erected devices at the Beijing Ancient Observatory site to enable them to accurately measure and track the positions of naked-eye stars and planets. Some of the large, ornate astronomical instruments are still standing. You can even see stars from the star observation platform today, but now only the very brightest celestial beacons are visible against the city lights. In this time series of exposures from a camera fixed to a tripod to record graceful arcing startrails, the brightest trail is actually the Moon. Its broad arc is seen behind the ancient observatory's brass armillary sphere. Compare this picture from the Beijing Ancient Observatory taken in September 2023 to one taken in 1895.",
        "media_type": "image",
        "thumbnail_url": null,
        "title": "Startrails over Beijing Ancient Observatory",
        "url": "https://apod.nasa.gov/apod/image/2312/StartrailsBeijingAncientObservatory-3_1024.jpg",
      },
      "2023-12-03": {
        "copyright": "El Cielo de Canarias",
        "date": "2023-12-03",
        "explanation":
            "These people are not in danger. What is coming down from the left is just the Moon, far in the distance. Luna appears so large here because she is being photographed through a telescopic lens.  What is moving is mostly the Earth, whose spin causes the Moon to slowly disappear behind Mount Teide, a volcano in the Canary Islands off the northwest coast of Africa. The people pictured are 16 kilometers away and  many are facing the camera because they are watching the Sun rise behind the photographer. It is not a coincidence that a full moon rises just when the Sun sets because the Sun is always on the opposite side of the sky from a full moon. The featured video was made in 2018 during the full Milk Moon.  The video is not time-lapse -- this was really how fast the Moon was setting.",
        "media_type": "video",
        "thumbnail_url": "https://img.youtube.com/vi/afHfMMC-MJE/0.jpg",
        "title": "Moon Setting Behind Teide Volcano",
        "url": "https://www.youtube.com/embed/afHfMMC-MJE?rel=0"
      }
    };
    test('should add all pictures to Hive', () async {
      // arrange
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenAnswer((_) async => mockedBox);
      when(mockedBox.putAll(dateWithPictureItemMap)).thenAnswer((_) async {});
      // act
      await localDataSource.savePictures(mockedResult);
      // assert
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
      verify(mockedBox.putAll(dateWithPictureItemMap));
    });

    test('should throw a DatabaseException when Hive throws an error', () async {
      // arrange
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenThrow(mockedHiveError);
      // act
      try {
        await localDataSource.savePictures(mockedResult);
      } catch (e) {
        //assert
        expect(e, mockedException);
      }
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
    });
  });

  group('searchPictureByDate', () {
    test('should return a PictureItemModel from Hive', () async {
      // arrange
      final testDate = DateTime.now();
      const testPictureMap = {
        "copyright": "El Cielo de Canarias",
        "date": "2023-12-03",
        "explanation":
            "These people are not in danger. What is coming down from the left is just the Moon, far in the distance. Luna appears so large here because she is being photographed through a telescopic lens.  What is moving is mostly the Earth, whose spin causes the Moon to slowly disappear behind Mount Teide, a volcano in the Canary Islands off the northwest coast of Africa. The people pictured are 16 kilometers away and  many are facing the camera because they are watching the Sun rise behind the photographer. It is not a coincidence that a full moon rises just when the Sun sets because the Sun is always on the opposite side of the sky from a full moon. The featured video was made in 2018 during the full Milk Moon.  The video is not time-lapse -- this was really how fast the Moon was setting.",
        "media_type": "video",
        "service_version": "v1",
        "thumbnail_url": "https://img.youtube.com/vi/afHfMMC-MJE/0.jpg",
        "title": "Moon Setting Behind Teide Volcano",
        "url": "https://www.youtube.com/embed/afHfMMC-MJE?rel=0"
      };
      const testPicture = PictureItemModel(
        mediaType: "video",
        date: "2023-12-03",
        explanation:
            "These people are not in danger. What is coming down from the left is just the Moon, far in the distance. Luna appears so large here because she is being photographed through a telescopic lens.  What is moving is mostly the Earth, whose spin causes the Moon to slowly disappear behind Mount Teide, a volcano in the Canary Islands off the northwest coast of Africa. The people pictured are 16 kilometers away and  many are facing the camera because they are watching the Sun rise behind the photographer. It is not a coincidence that a full moon rises just when the Sun sets because the Sun is always on the opposite side of the sky from a full moon. The featured video was made in 2018 during the full Milk Moon.  The video is not time-lapse -- this was really how fast the Moon was setting.",
        title: "Moon Setting Behind Teide Volcano",
        url: "https://www.youtube.com/embed/afHfMMC-MJE?rel=0",
        thumbnailUrl: "https://img.youtube.com/vi/afHfMMC-MJE/0.jpg",
        copyright: "El Cielo de Canarias",
      );
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenAnswer((_) async => mockedBox);
      when(mockedBox.get(testDate.toStringRemote())).thenReturn(testPictureMap);
      // act
      final result = await localDataSource.searchPictureByDate(testDate);
      // assert
      expect(result, testPicture);
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
      verify(mockedBox.get(testDate.toStringRemote()));
    });

    test('should throw a DatabaseException when Hive throws an error', () async {
      // arrange
      final testDate = DateTime.now();
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenThrow(mockedHiveError);
      try {
        await localDataSource.searchPictureByDate(testDate);
      } catch (e) {
        //assert
        expect(e, mockedException);
      }
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
    });

    test('should throw a NoValuesFoundedOnCache exception when Hive returns null', () async {
      // Arrange
      final testDate = DateTime.now();
      when(mockDatabase.getBox(HiveBoxType.pictureItemBox)).thenAnswer((_) async => mockedBox);
      when(mockedBox.get(testDate.toStringRemote())).thenReturn(null);

      try {
        await localDataSource.searchPictureByDate(testDate);
      } catch (e) {
        //assert
        expect(e, isA<NoValuesFoundedOnCacheException>());
      }
      verify(mockDatabase.getBox(HiveBoxType.pictureItemBox));
      verify(mockedBox.get(testDate.toStringRemote()));
    });
  });

  group('cleanCache', () {
    test('should clean all boxes in Hive', () async {
      // arrange
      when(mockDatabase.cleanAllBoxes()).thenAnswer((_) async {});
      // act
      await localDataSource.cleanCache();
      // assert
      verify(mockDatabase.cleanAllBoxes());
    });

    test('should throw a DatabaseException when Hive throws an error', () async {
      // arrange
      when(mockDatabase.cleanAllBoxes()).thenThrow(mockedHiveError);
      try {
        await localDataSource.cleanCache();
      } catch (e) {
        //assert
        expect(e, mockedException);
      }
      verify(mockDatabase.cleanAllBoxes());
    });
  });
}
