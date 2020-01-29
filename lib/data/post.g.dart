// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      json['author'] ?? "",
      json['title'] ?? "",
      json['description'] ?? "",
      json['url'] ?? "",
      json['urlToImage'] ?? "",
      getDate(json['publishedAt'] ?? "--T::Z"),
      json['content'] ?? "");
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content
    };

String getDate(String dateTime){
  String date = dateTime.split("T")[0];
  String time = dateTime.split("T")[1].split("Z")[0];
  return date.split("-").join(".") + " " + time;
}
