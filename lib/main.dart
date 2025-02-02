import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testappp/test.dart';

import 'modal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
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
    )
    );
  }
}
