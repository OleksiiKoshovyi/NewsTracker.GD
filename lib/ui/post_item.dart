import 'package:flutter/material.dart';
import 'package:gd_login/data/post.dart';
import 'post_comment_screen.dart';
import 'package:share/share.dart';


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
                Icon(Icons.description, size: 40,),
                SizedBox(width: 10),
                Text(
                  _item.source.name,
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
        child: Image.network(_item.urlToImage),
      ),
    );
  }

  Widget _getPostControls(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: LikeButton(),
                ),
                GestureDetector(
                    onTap: () => _navigateToDetail(context),
                    child: Icon(Icons.message),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {Share.share(_item.url);},
                    child: Icon(Icons.send),),
                ),
              ],
            ),
          ),
          Container(
            child:Row(
              children: <Widget>[
                ArchiveButton()
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
                  TextSpan(text: 'nobody', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' та '),
                  TextSpan(text: 'інші\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: _item.author + ". ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: _item.description),
                  /*TextSpan(text: '#griddynamics_kharkiv #itkharkov #flutter \r\n#workshop', style: TextStyle(color: Color(0xff0000ff))),*/
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
          Text(_item.publishedAt, style: TextStyle(color: Color(0xffaaaaaa),),),
        ],
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LikeButton();
}
class _LikeButton extends State<LikeButton>{
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFavorite = !isFavorite;
        setState(() {

        });
      },
      child: isFavorite ? Icon(
        Icons.favorite,
        color: Colors.red,
      ): Icon(Icons.favorite_border)
    );
  }
}

class ArchiveButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ArchiveButton();
}
class _ArchiveButton extends State<ArchiveButton>{
  bool isArchived = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          isArchived = !isArchived;
          setState(() {

          });
        },
        child: isArchived ? Icon(
          Icons.turned_in,
          color: Colors.blue,
        ): Icon(Icons.turned_in_not)
    );
  }
}