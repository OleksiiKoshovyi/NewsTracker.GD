import 'package:flutter/material.dart';
import 'package:gd_login/data/post.dart';
import 'post_comment_screen.dart';

class PostItem extends StatelessWidget {
  final Post _item;

  PostItem(this._item);

  @override
  Widget build(BuildContext context) {
    return _getPostContent(context);
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostCommentScreen(_item)));
  }

  Widget _getPostContent(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _getTopPostInfo(),
          _getPostImage(),
          _getPostControls(context),
          _getPostText(),
          _getPostDate(),
        ],
      ),);

  }

  Widget _getTopPostInfo(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,10,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Image.asset(
                  'res/gd_logo.jpg',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Text(
                  "griddynamics_ua",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }

  Widget _getPostImage(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: Container(
        child: Image.network(_item.url),
        /*decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(9)),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(_item.url)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(3, 3),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ]),*/
      ),
    );
  }

  Widget _getPostControls(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(Icons.favorite_border,),
                ),
                GestureDetector(
                    onTap: () => _navigateToDetail(context),
                    child: Icon(Icons.message),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
          Container(
            child:Row(
              children: <Widget>[
                Icon(Icons.turned_in_not),
              ],),
          ),
        ],),
    );
  }

  Widget _getPostText(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'уподобали '),
                  TextSpan(text: 'human', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' та '),
                  TextSpan(text: 'інші\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'griddynamics_ua ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '📢 Welcome to the Flutter workshop from Grid Dynamics. In this course, you will learn how to create Flutter applications efficiently and simply, as every lecture comes with a full coding screencast and broadcasting code on a laptop. We are updating this course frequently, as flutter and dart are in their early stages of development. So what are you waiting for? 📆 The first class will be on January 20. 📌 More info and registration are on our bio.\r\n.\r\n'),
                  TextSpan(text: '#griddynamics_kharkiv #itkharkov #flutter \r\n#workshop', style: TextStyle(color: Color(0xff0000ff))),
                ],
              ),
            ),
          ),
        ],),
    );
  }

  Widget _getPostDate(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('28 листопада 2019', style: TextStyle(color: Color(0xffaaaaaa),),),
        ],
      ),
    );
  }}