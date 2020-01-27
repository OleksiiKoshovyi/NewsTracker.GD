import 'dart:async';
import 'package:gd_login/data/post.dart';
import 'package:gd_login/networking/repository.dart';
import 'base_bloc.dart';

class PostBloc extends Bloc {
  final _repo = Repo();

  final _postListStream = StreamController<List<Post>>();

  Stream<List<Post>> get postStream => _postListStream.stream;

  void fetchPost() async {
    var posts = await _repo.fetchPost();
    _postListStream.sink.add(posts);
  }

  @override
  void dispose() {
    _postListStream.close();
  }
}