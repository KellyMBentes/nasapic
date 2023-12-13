import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> isConnected();
}

@Injectable(as: INetworkInfo)
class NetworkInfoImpl implements INetworkInfo {
  String checkUrl = 'https://google.com';
  final Connectivity connectivity;
  final Dio dio;

  NetworkInfoImpl({required this.connectivity, required this.dio});

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      try {
        final response = await dio.getUri(Uri.parse(checkUrl));
        return response.statusCode == 200;
      } catch (e) {
        return false;
      }
    }
  }
}
