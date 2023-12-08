enum HiveBoxType {
  imageBox,
  pictureItemBox,
}

extension HiveBoxTypeExtension on HiveBoxType {
  String get name {
    switch (this) {
      case HiveBoxType.imageBox:
        return 'image';
      case HiveBoxType.pictureItemBox:
        return 'picture';
    }
  }
}
