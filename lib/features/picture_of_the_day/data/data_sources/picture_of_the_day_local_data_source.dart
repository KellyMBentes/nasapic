import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/data/hive_database.dart';
import 'package:nasapic/core/error/cache_exception.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/hive_box_type.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart';
import 'package:nasapic/injection.dart';

abstract class IPictureOfTheDayLocalDataSource {
  Future<List<PictureItemModel>> getAllPictures();
  Future<PictureItemModel> searchPictureByDate(DateTime date);
  Future<void> savePictures(List<PictureItemModel> pictures);
  Future<void> cleanCache();
}

@Injectable(as: IPictureOfTheDayLocalDataSource, env: [Env.dev])
class PictureOfTheDayLocalDataSource extends IPictureOfTheDayLocalDataSource {
  final IHiveDatabase _database;

  PictureOfTheDayLocalDataSource(this._database);

  @override
  Future<List<PictureItemModel>> getAllPictures() async {
    try {
      final Box pictureItemBox = await _database.getBox(HiveBoxType.pictureItemBox);
      final values = pictureItemBox.values.map<PictureItemModel>((p) => PictureItemModel.fromJson(p)).toList();
      return values;
    } on HiveError catch (e) {
      throw DatabaseException(message: e.message);
    }
  }

  @override
  Future<void> savePictures(List<PictureItemModel> pictures) async {
    try {
      final Box pictureItemBox = await _database.getBox(HiveBoxType.pictureItemBox);
      final Map<dynamic, Map<String, dynamic>> picturesMap = {};
      for (PictureItemModel picture in pictures) {
        picturesMap.addAll({picture.date: picture.toJson()});
      }
      await pictureItemBox.putAll(picturesMap);
    } on HiveError catch (e) {
      throw DatabaseException(message: e.message);
    }
  }

  @override
  Future<PictureItemModel> searchPictureByDate(DateTime date) async {
    try {
      final Box pictureItemBox = await _database.getBox(HiveBoxType.pictureItemBox);
      final Map<String, dynamic>? pictureItemValue = pictureItemBox.get(date.toStringRemote());

      if (pictureItemValue == null) throw NoValuesFoundedOnCacheException();

      return PictureItemModel.fromJson(pictureItemValue);
    } on HiveError catch (e) {
      throw DatabaseException(message: e.message);
    }
  }

  @override
  Future<void> cleanCache() {
    try {
      return _database.cleanAllBoxes();
    } on HiveError catch (e) {
      throw DatabaseException(message: e.message);
    }
  }
}
