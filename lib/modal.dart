import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

class MovieList {
    List<Movie> movies;

    MovieList({ this.movies,});

    factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
    );
}

class Movie {
    String name;
    List<Actor> actors;
    List<Category> category;
    String timeM;
    String text;
    String image;

    Movie({ this.name, this.actors, this.category, this.timeM, this.text, this.image,});

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        name: json["name"],
        actors: List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        timeM: json["timeM"] == null ? null : json["timeM"],
        text: json["text"],
        image: json["image"],
    );
}

class Actor {
    String name1;
    String name2;
    String name3;

    Actor({this.name1,this.name2,this.name3,
    });

    factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        name1: json["name1"] == null ? null : json["name1"],
        name2: json["name2"] == null ? null : json["name2"],
        name3: json["name3"] == null ? null : json["name3"],
    );
}

class Category {
    String genre1;
    String genre2;
    String genre3;

    Category({this.genre1,this.genre2,this.genre3,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        genre1: json["genre1"] == null ? null : json["genre1"],
        genre2: json["genre2"] == null ? null : json["genre2"],
        genre3: json["genre3"] == null ? null : json["genre3"],
    );
}