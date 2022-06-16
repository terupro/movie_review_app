// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as String?,
      title: json['title'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      impression: json['impression'] as String,
      imgURL: json['imgURL'] as String?,
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rating': instance.rating,
      'impression': instance.impression,
      'imgURL': instance.imgURL,
    };
