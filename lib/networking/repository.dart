import 'package:gd_login/data/post.dart';
class Repo {
  static final Repo _instance = Repo._internal();

  factory Repo() {
    return _instance;
  }

  Repo._internal();

  Future<List<Post>> fetchPost() =>
      Future.delayed(Duration(seconds: 3), () =>  postSubs);
}

var postSubs = [
  Post.defaultPost(),
  Post.defaultPost(),
  Post.defaultPost(),
];