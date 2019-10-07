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
      future: rootBundle.loadString('assets/movies.json'),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          var movies = movieListFromJson(snap.data);
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.deepPurple, title: Text('Movies')),
              body: Column(
                children:
                    movies.movies.map((movie) => Text(movie.name)).toList(),
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
