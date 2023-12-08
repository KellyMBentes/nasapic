import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/hive_box_type.dart';

abstract class IHiveDatabase {
  Future<void> init();
  Future<Box> getBox(HiveBoxType type);
  Future<void> cleanAllBoxes();
}

class HiveDatabaseImpl extends IHiveDatabase {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  @override
  Future<Box> getBox(HiveBoxType type) async {
    switch (type) {
      case HiveBoxType.imageBox:
        return Hive.isBoxOpen(type.name) ? Hive.box<Uint8List>(type.name) : await Hive.openBox<Uint8List>(type.name);
      case HiveBoxType.pictureItemBox:
        return Hive.isBoxOpen(type.name) ? Hive.box<Map<String, dynamic>>(type.name) : await Hive.openBox<Map<String, dynamic>>(type.name);
    }
  }

  @override
  Future<void> cleanAllBoxes() async {
    for (HiveBoxType boxType in HiveBoxType.values) {
      await Hive.box(boxType.name).clear();
    }
  }
}
