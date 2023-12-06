import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  getIt.init(environment: env);
}

abstract class Env {
  static const dev = 'dev';
  static const demo = 'demo';
}

@module
abstract class DioModule {
  @Named("BaseUrl")
  String get baseUrl => 'https://api.nasa.gov/planetary/apod';

  @Named("ApiKey")
  String get apiKey => 'DEMO_KEY';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url, @Named('ApiKey') String apiKey) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        queryParameters: {
          'api_key': apiKey,
          'thumbs': true,
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(logPrint: (o) => debugPrint(o.toString())),
    );

    return dio;
  }
}
