import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Дописи'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              exit(0);
            }),
      ),
      body: Center(

        child: _getListView(),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _getBody(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
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
          SizedBox(height: 10),
          Container(
            child: Image.asset(
              'res/gd_main.jpg',
              fit: BoxFit.cover,
            ),
        ),
          SizedBox(height: 10),
          Row(         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Icon(Icons.favorite_border,),
                  SizedBox(width: 20),
                  Icon(Icons.message),
                  SizedBox(width: 20),
                  Icon(Icons.send),
                ],
              ),
            ),
            Container(
              child:Row(
                children: <Widget>[
                  Icon(Icons.turned_in_not),
                  SizedBox(width: 10),
                ],),
            ),
          ],),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Text.rich(TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'уподобали '),
                  TextSpan(text: 'human', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' та '),
                  TextSpan(text: 'інші', style: TextStyle(fontWeight: FontWeight.bold)),
                ],),),
              SizedBox(width: 10),
            ],),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Flexible(child: Text.rich(TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'griddynamics_ua ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '📢 Welcome to the Flutter workshop from Grid Dynamics. In this course, you will learn how to create Flutter applications efficiently and simply, as every lecture comes with a full coding screencast and broadcasting code on a laptop. We are updating this course frequently, as flutter and dart are in their early stages of development. So what are you waiting for? 📆 The first class will be on January 20. 📌 More info and registration are on our bio.\r\n.\r\n'),
                  TextSpan(text: '#griddynamics_kharkiv #itkharkov #flutter \r\n#workshop', style: TextStyle(color: Color(0xff0000ff))),
                ],))),
              SizedBox(width: 10),
            ],),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10),
              Text('28 листопада 2019', style: TextStyle(color: Color(0xffaaaaaa),),),
            ],
          ),
          SizedBox(height: 5),
      ],
    ),);
  }

  Widget _getListView(){
    return Center(
      child: ListView(
        children: <Widget>[
          _getBody(),
        ],
      ),
    );
  }

  Widget _getBottomTab(){
    return Center(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.add_box),
          Icon(Icons.favorite_border),
          Icon(Icons.person_outline),
        ],
      ),
    );
  }

  Widget _getAll(){
    return Center(
      child: _getBottomTab(),
    );
  }
}


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
    );
  }
}



