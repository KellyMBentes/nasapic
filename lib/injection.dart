import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/data/hive_database.dart';
import 'package:nasapic/injection.config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  await getIt.init(environment: env);
}

abstract class Env {
  static const dev = 'dev';
  static const demo = 'demo';
}

@module
abstract class ExternalModule {
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

  @lazySingleton
  @preResolve
  Future<IHiveDatabase> hiveDatabase() async {
    IHiveDatabase database = HiveDatabaseImpl();
    await database.init();
    return database;
  }

  @lazySingleton
  @preResolve
  Future<Connectivity> connectivity() async {
    return Connectivity();
  }
}
