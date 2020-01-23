import 'dart:io';

import 'package:flutter/material.dart';

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
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        child: _getBody(),
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  Widget _getBody(){
    return Center(
      child: ListView(
        children: <Widget>[
          for(var post in _getPosts())post
        ],
      ),
    );
  }


  List<Widget> _getPosts(){
    return [_getPostContent(),_getPostContent(),_getPostContent(),];
  }

  Widget _getPostContent(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _getTopPostInfo(),
          _getPostImage(),
          _getPostControls(),
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
        child: Image.asset(
          'res/gd_main.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getPostControls(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
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
  }

  Widget _getBottomNavigationBar(){
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          title: Text('Add'),
        ),BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text('Favorite'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Account'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }

}



