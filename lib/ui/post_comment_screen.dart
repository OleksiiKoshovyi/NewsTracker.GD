import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_login/data/post.dart';
import 'package:url_launcher/url_launcher.dart';

class PostCommentScreen extends StatelessWidget {
  final Post _item;

  PostCommentScreen(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Коментарі"),
      ),
      body: _getBody(),
      bottomSheet: _getBottomSheet(),
    );
  }

  Widget _getBody(){
    return Center(child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getLogo(),_getText()
            ],
          ),
        ],
      ),
    ));
  }

  static Widget _getLogo(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,10,0),
      child: Icon(Icons.description,size: 40,),
    );
  }

  Widget _getText(){
    return Flexible(
          child:GestureDetector(
            onTap: () => _launchURL(_item.url),
            child:
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: _item.author+". ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: _item.description+"\r\n"),
                  TextSpan(text: _item.url+"\r\n\r\n", style: TextStyle(color: Color(0xff0000ff))),
                  TextSpan(text: _item.publishedAt, style: TextStyle(color: Color(0xffaaaaaa))),
                ],
              ),
            ),
          ),
    );
  }

  Widget _getBottomSheet(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _getLogo(),
          Text("Додайте коментар...",),
          Text("Опубліковати", style: TextStyle(color: Color(0x550000ff),),),
        ],
      ),
    );
  }

  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Додайте коментар...',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Будь ласка, додайте коментар';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
