// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PictureItemModelImpl _$$PictureItemModelImplFromJson(Map<String, dynamic> json) => _$PictureItemModelImpl(
      mediaType: json['media_type'] as String,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$$PictureItemModelImplToJson(_$PictureItemModelImpl instance) => <String, dynamic>{
      'media_type': instance.mediaType,
      'date': instance.date,
      'explanation': instance.explanation,
      'title': instance.title,
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
      'copyright': instance.copyright,
    };
