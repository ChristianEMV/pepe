import 'dart:convert';

class Movie {
  final int id;
  final String title;
  final String director;
  final int year;
  final List<String> genres;
  final String poster;
    final String description;


  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.year,
    required this.genres,
    required this.poster,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      year: json['year'],
      genres: List<String>.from(json['genres']),
      poster: json['poster'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'director': director,
      'year': year,
      'genres': genres,
      'poster': poster,
      'description': description,
    };
  }
}

List<Movie> parseMovies(String jsonString) {
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}