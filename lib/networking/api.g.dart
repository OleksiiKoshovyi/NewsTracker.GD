// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://newsapi.org/v2/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getTasks(apiKey, country, pageSize, page) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'apiKey': apiKey,
      'country': country,
      'pageSize': pageSize,
      'page': page
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'top-headlines',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsListResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
