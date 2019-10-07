import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modal.dart';


class App extends StatefulWidget {
@override
_AppState createState() => _AppState();
}

class _AppState extends State<App> {

@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future:  rootBundle.loadString('assets/movies.json'),
    builder: (BuildContext context, AsyncSnapshot snap){
      if(snap.hasData){
          var movies = movieListFromJson(snap.data);
          return Scaffold(
             appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Movies') 
            ),
            body: Column(
              children: movies.movies.map((movie) => Text(movie.name)).toList(),
            )
          );
      } else {
         return LoadingScreen();
      }
    },
  );
}
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: CircularProgressIndicator(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Loader(),
      ),
    );
  }
}