import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart';
import 'package:nasapic/features/picture_of_the_day/erros/picture_exception.dart';
import 'package:nasapic/injection.dart';

abstract class IPictureOfTheDayRemoteDataSource {
  Future<List<PictureItemModel>> getAllPictures(int page, int count);
  Future<PictureItemModel> searchPictureByDate(DateTime date);
}

@Injectable(as: IPictureOfTheDayRemoteDataSource, env: [Env.dev])
class PictureOfTheDayRemoteDataSourceImpl extends IPictureOfTheDayRemoteDataSource {
  final Dio _dio;

  PictureOfTheDayRemoteDataSourceImpl(this._dio);

  @override
  Future<List<PictureItemModel>> getAllPictures(int page, int count) async {
    final DateTime currentDate = DateTime.now();
    final DateTime endDate = currentDate.subtract(Duration(days: count * (page - 1)));
    final DateTime startDate = endDate.subtract(Duration(days: count));

    final response = await _dio.get(
      '',
      queryParameters: {'start_date': startDate.toStringRemote(), 'end_date': endDate.toStringRemote()},
    );

    if (response.statusCode == 200) {
      final result = (response.data as List<dynamic>).map((value) => PictureItemModel.fromJson(value as Map<String, dynamic>)).toList();
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PictureItemModel> searchPictureByDate(DateTime date) async {
    final response = await _dio.get(
      '',
      queryParameters: {'date': date.toStringRemote()},
    );

    if (response.statusCode == 200) {
      final result = PictureItemModel.fromJson(response.data as Map<String, dynamic>);
      return result;
    } else {
      throw ServerException();
    }
  }
}
