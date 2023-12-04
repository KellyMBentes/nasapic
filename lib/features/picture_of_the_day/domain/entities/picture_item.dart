import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'picture_item.freezed.dart';

@freezed
class PictureItem with _$PictureItem {
  const factory PictureItem({
    required DateTime date,
    required String explanation,
    required String title,
    required String imageUrl,
  }) = _PictureItem;
}
