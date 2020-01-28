import 'dart:async';
import 'package:gd_login/data/post.dart';
import 'package:gd_login/networking/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'base_bloc.dart';

class PostBloc extends Bloc {
  final _repo = Repo.instance;
  int page = 1;
  int pageSize = 5;
  int maxPage = 1;

  final _newsListStream = BehaviorSubject<List<Post>>();

  PostBloc(){
    _newsListStream.add([]);
  }

  Stream<List<Post>> get postStream => _newsListStream.stream;

  void fetchPost({step: 0}) async {
    page+= page+step > maxPage ? 0 : step;
    var response = await _repo.fetchPost(page: page, pageSize: pageSize);
    maxPage = (38/pageSize).floor();
    _newsListStream.value.addAll(response.articles);
    _newsListStream.sink.add(_newsListStream.value);
    _newsListStream.sink.add(response.articles);
  }

  @override
  void dispose() {
    _newsListStream.close();
  }
}