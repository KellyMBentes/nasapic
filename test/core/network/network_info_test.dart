import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasapic/core/network/network_info.dart';

@GenerateNiceMocks([MockSpec<Connectivity>()])
@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<RequestOptions>()])
import './network_info_test.mocks.dart';

void main() {
  late Dio mockedDio;
  late RequestOptions mockedRequestOptions;
  late Connectivity mockedConnectivity;
  late INetworkInfo networkInfo;
  late Uri testUri;

  setUp(() {
    mockedDio = MockDio();
    mockedRequestOptions = MockRequestOptions();
    mockedConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectivity: mockedConnectivity, dio: mockedDio);
    testUri = Uri.parse(networkInfo.checkUrl);
  });

  test('isConnected returns true when connection is successful', () async {
    // arrange
    when(mockedConnectivity.checkConnectivity()).thenAnswer((_) => Future.value(ConnectivityResult.mobile));
    when(mockedDio.getUri(testUri)).thenAnswer((_) => Future.value(Response(requestOptions: mockedRequestOptions, statusCode: 200)));
    // act
    final result = await networkInfo.isConnected();
    // assert
    expect(result, true);
    verify(mockedDio.getUri(testUri));
    verify(mockedConnectivity.checkConnectivity());
  });

  test('isConnected returns false when connectivity is none', () async {
    // arrange
    when(mockedConnectivity.checkConnectivity()).thenAnswer((_) => Future.value(ConnectivityResult.none));
    // act
    final result = await networkInfo.isConnected();
    // assert
    expect(result, false);
    verifyNever(mockedDio.getUri(testUri));
    verify(mockedConnectivity.checkConnectivity());
  });

  test('isConnected returns false when dio connection fails', () async {
    //arrange
    when(mockedConnectivity.checkConnectivity()).thenAnswer((_) => Future.value(ConnectivityResult.wifi));
    when(mockedDio.getUri(testUri)).thenThrow(Exception());
    // act
    final result = await networkInfo.isConnected();
    // assert
    expect(result, false);
    verify(mockedDio.getUri(testUri));
    verify(mockedConnectivity.checkConnectivity());
  });

  test('isConnected() handles connectivity check exception', () async {
    // arrange
    when(mockedConnectivity.checkConnectivity()).thenThrow(Exception());
    // act
    final result = await networkInfo.isConnected();
    // assert
    expect(result, false);
    verifyNever(mockedDio.getUri(testUri));
    verify(mockedConnectivity.checkConnectivity());
  });
}
