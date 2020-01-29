import 'package:flutter/material.dart';
import 'package:gd_login/ui/home_page_screen.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/fetch_post_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: PostBloc(),
      child: MaterialApp(
        title: 'News',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}




