// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaResponseModel _$MetaResponseModelFromJson(Map<String, dynamic> json) =>
    MetaResponseModel(
      totalCount: json['total_count'] as int,
      prevPage: json['prev_page'] as int?,
      currentPage: json['current_page'] as int?,
      nextPage: json['next_page'] as int?,
    );

Map<String, dynamic> _$MetaResponseModelToJson(MetaResponseModel instance) =>
    <String, dynamic>{
      'prev_page': instance.prevPage,
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'total_count': instance.totalCount,
    };
