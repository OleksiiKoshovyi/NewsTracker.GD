import 'package:gd_login/networking/api.dart';
import 'package:gd_login/networking/response/news_list_response.dart';
import 'package:dio/dio.dart';

const String apiKey = '38e919115aa846cebed1afe4dd66f5a3';

class Repo {
  static final Repo instance = Repo._internal();

  Dio _dioClient = Dio();
  RestClient _restClient;

  Repo._internal(){
    _restClient = RestClient(_dioClient);
  }

  Future<NewsListResponse> fetchPost({country = "us", pageSize = 5, page = 1}) async =>
      await _restClient.getTasks(apiKey, country, pageSize, page);
}
