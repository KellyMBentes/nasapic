import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
part 'picture_item_model.freezed.dart';
part 'picture_item_model.g.dart';

@freezed
class PictureItemModel with _$PictureItemModel {
  const PictureItemModel._();

  const factory PictureItemModel({
    @JsonKey(name: 'media_type') required String mediaType,
    required String date,
    required String explanation,
    required String title,
    required String url,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    String? copyright,
  }) = _PictureItemModel;

  PictureItem toEntity() {
    return PictureItem(
      date: DateTime.parse(date),
      explanation: explanation,
      title: title,
      imageUrl: (mediaType == 'video') ? thumbnailUrl! : url,
    );
  }

  factory PictureItemModel.fromJson(Map<String, Object?> json) => _$PictureItemModelFromJson(json);
}
