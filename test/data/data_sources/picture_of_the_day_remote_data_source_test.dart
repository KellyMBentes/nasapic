import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasapic/core/error/remote_exception.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<RequestOptions>()])
import './picture_of_the_day_remote_data_source_test.mocks.dart';

void main() {
  late Dio mockedDio;
  late IPictureOfTheDayRemoteDataSource remoteDataSource;
  late RequestOptions mockedRequestOptions;

  setUp(() {
    mockedDio = MockDio();
    mockedRequestOptions = MockRequestOptions();
    remoteDataSource = PictureOfTheDayRemoteDataSourceImpl(mockedDio);
  });

  group('getAllPictures method', () {
    const int page = 1;
    const int count = 10;
    const String url = '';
    final DateTime currentDate = DateTime.now();
    final String startDate = currentDate.subtract(const Duration(days: 10)).toStringRemote();
    final String endDate = currentDate.toStringRemote();
    test(
      "should return picture list when dio returns success",
      () async {
        // arrange
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

        when(mockedDio.get(
          url,
          queryParameters: {'start_date': startDate, 'end_date': endDate},
        )).thenAnswer((_) async => Response(requestOptions: mockedRequestOptions, statusCode: 200, data: mockedResultMap));
        // act
        final result = await remoteDataSource.getAllPictures(page, count);
        // assert
        expect(result, mockedResult);
      },
    );

    test(
      "should return server exception in getAll when dio returns error code 400",
      () async {
        // arrange
        const Map<String, dynamic> mockedError400 = {
          "code": 400,
          "msg": "Date must be between Jun 16, 1995 and Dec 11, 2023.",
          "service_version": "v1"
        };
        const ServerException mockedException = ServerException(code: 400, message: "Date must be between Jun 16, 1995 and Dec 11, 2023.");
        when(mockedDio.get(
          url,
          queryParameters: {'start_date': startDate, 'end_date': endDate},
        )).thenAnswer((_) async => Response(requestOptions: mockedRequestOptions, statusCode: 400, data: mockedError400));
        // act
        try {
          await remoteDataSource.getAllPictures(page, count);
        } catch (e) {
          // assert
          expect(e, mockedException);
        }
      },
    );

    test(
      "should return server exception in getAll when dio returns error code 403",
      () async {
        // arrange
        const Map<String, dynamic> mockedError403 = {
          "error": {"code": "API_KEY_INVALID", "message": "An invalid api_key was supplied. Get one at https://api.nasa.gov:443"}
        };
        const ServerException mockedException =
            ServerException(code: 403, message: "An invalid api_key was supplied. Get one at https://api.nasa.gov:443");
        when(mockedDio.get(
          url,
          queryParameters: {'start_date': startDate, 'end_date': endDate},
        )).thenAnswer((_) async => Response(requestOptions: mockedRequestOptions, statusCode: 403, data: mockedError403));
        // act
        try {
          await remoteDataSource.getAllPictures(page, count);
        } catch (e) {
          // assert
          expect(e, mockedException);
        }
      },
    );

    test(
      "should throw NoInternetConnectionException on connection error in getAll",
      () async {
        // arrange
        when(mockedDio.get(
          url,
          queryParameters: {'start_date': startDate, 'end_date': endDate},
        )).thenThrow(DioException.connectionError(requestOptions: mockedRequestOptions, reason: "No internet"));
        // act
        try {
          await remoteDataSource.getAllPictures(page, count);
        } catch (e) {
          // assert
          expect(e, isA<NoInternetConnectionException>());
        }
      },
    );
  });

  group('getAllPictures method', () {
    const String url = '';
    final DateTime date = DateTime(2023, 12, 03);
    test(
      "should return picture when dio returns success",
      () async {
        // arrange
        const Map<String, dynamic> mockedResultMap = {
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

        const PictureItemModel mockedResult = PictureItemModel(
          mediaType: "video",
          date: "2023-12-03",
          explanation:
              "These people are not in danger. What is coming down from the left is just the Moon, far in the distance. Luna appears so large here because she is being photographed through a telescopic lens.  What is moving is mostly the Earth, whose spin causes the Moon to slowly disappear behind Mount Teide, a volcano in the Canary Islands off the northwest coast of Africa. The people pictured are 16 kilometers away and  many are facing the camera because they are watching the Sun rise behind the photographer. It is not a coincidence that a full moon rises just when the Sun sets because the Sun is always on the opposite side of the sky from a full moon. The featured video was made in 2018 during the full Milk Moon.  The video is not time-lapse -- this was really how fast the Moon was setting.",
          title: "Moon Setting Behind Teide Volcano",
          url: "https://www.youtube.com/embed/afHfMMC-MJE?rel=0",
          thumbnailUrl: "https://img.youtube.com/vi/afHfMMC-MJE/0.jpg",
          copyright: "El Cielo de Canarias",
        );

        when(mockedDio.get(
          url,
          queryParameters: {'date': date.toStringRemote()},
        )).thenAnswer((_) async => Response(requestOptions: mockedRequestOptions, statusCode: 200, data: mockedResultMap));
        // act
        final result = await remoteDataSource.searchPictureByDate(date);
        // assert
        expect(result, mockedResult);
      },
    );

    test(
      "should return server exception in search when dio returns error code 400",
      () async {
        // arrange
        const Map<String, dynamic> mockedError400 = {
          "code": 400,
          "msg": "Date must be between Jun 16, 1995 and Dec 11, 2023.",
          "service_version": "v1"
        };
        const ServerException mockedException = ServerException(code: 400, message: "Date must be between Jun 16, 1995 and Dec 11, 2023.");
        when(mockedDio.get(
          url,
          queryParameters: {'date': date.toStringRemote()},
        )).thenAnswer((_) async => Response(requestOptions: mockedRequestOptions, statusCode: 400, data: mockedError400));
        // act
        try {
          await remoteDataSource.searchPictureByDate(date);
        } catch (e) {
          // assert
          expect(e, mockedException);
        }
      },
    );

    test(
      "should return server exception in search when dio returns error code 403",
      () async {
        // arrange
        const Map<String, dynamic> mockedError403 = {
          "error": {"code": "API_KEY_INVALID", "message": "An invalid api_key was supplied. Get one at https://api.nasa.gov:443"}
        };
        const ServerException mockedException =
            ServerException(code: 403, message: "An invalid api_key was supplied. Get one at https://api.nasa.gov:443");
        when(mockedDio.get(
          url,
          queryParameters: {'date': date.toStringRemote()},
        )).thenAnswer((_) async => Response(requestOptions: mockedRequestOptions, statusCode: 403, data: mockedError403));
        // act
        try {
          await remoteDataSource.searchPictureByDate(date);
        } catch (e) {
          // assert
          expect(e, mockedException);
        }
      },
    );

    test(
      "should throw NoInternetConnectionException on connection error in search",
      () async {
        // arrange
        when(mockedDio.get(
          url,
          queryParameters: {'date': date.toStringRemote()},
        )).thenThrow(DioException.connectionError(requestOptions: mockedRequestOptions, reason: "No internet"));
        // act
        try {
          await remoteDataSource.searchPictureByDate(date);
        } catch (e) {
          // assert
          expect(e, isA<NoInternetConnectionException>());
        }
      },
    );
  });
}
