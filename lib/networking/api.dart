import 'package:gd_login/networking/response/news_list_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

const String baseUrl = 'https://newsapi.org/v2/';

//endpoint
/*const String popularMovies = 'movie/popular';
const String genres = 'genre/movie/list';
const String discover = 'discover/movie';

//query parameters
const String withGenres = 'with_genres';*/

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("top-headlines")
  Future<NewsListResponse> getTasks(
      @Query('apiKey') String apiKey,
      @Query('country') String country,
      @Query('pageSize') int pageSize,
      @Query('page') int page
      );
}