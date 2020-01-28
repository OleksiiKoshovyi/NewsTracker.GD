import 'package:flutter/material.dart';
import 'package:gd_login/bloc/bloc_provider.dart';
import 'package:gd_login/bloc/fetch_post_bloc.dart';
import 'package:gd_login/data/post.dart';
import 'post_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  var _scrollController = ScrollController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    var bloc = BlocProvider.of<PostBloc>(context);
    bloc.fetchPost();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        bloc.fetchPost(step: 1);
        //buildBody(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: buildBody(context),
      bottomNavigationBar: _getBottomNavigationBar(),
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

  Widget _getAppBar(){
    return AppBar(
      title: Text((widget.title) == null ? "Дописи" : widget.title),
    );
  }

  Widget buildBody(BuildContext context) {
    var bloc = BlocProvider.of<PostBloc>(context);
    bloc.fetchPost();

    return Container(
      child: StreamBuilder<List<Post>>(
          stream: bloc.postStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildPostList(snapshot.data);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }

  Widget _buildPostList(List<Post> list) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Container(child: PostItem(list[index]));
            }),
      ),
    );
  }
}