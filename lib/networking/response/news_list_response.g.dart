// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListResponse _$NewsListResponseFromJson(Map<String, dynamic> json) {
  return NewsListResponse(
      json['total_results'] as int,
      json['status'] as String,
      (json['articles'] as List)
          ?.map((e) =>
              e == null ? null : Post.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsListResponseToJson(NewsListResponse instance) =>
    <String, dynamic>{
      'total_results': instance.totalResults,
      'status': instance.status,
      'articles': instance.articles
    };
