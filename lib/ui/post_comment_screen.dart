import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gd_login/data/post.dart';

class PostCommentScreen extends StatelessWidget {
  final Post _detail;

  PostCommentScreen(this._detail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              exit(0);
            }),
        title: Text("Post"),
      ),
      body: Center(child: Text(_detail.name)),
    );
  }
}