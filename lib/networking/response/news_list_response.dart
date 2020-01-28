import 'package:gd_login/data/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse {
  NewsListResponse(this.totalResults, this.status, this.articles);

  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'articles')
  List<Post> articles;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListResponseToJson(this);
}