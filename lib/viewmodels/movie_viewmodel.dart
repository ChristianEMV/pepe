import 'package:flutter/material.dart';
import 'package:eru1/models/movies.dart';
import 'package:eru1/services/movies_service.dart';

class MovieViewmodel extends ChangeNotifier{
  final MoviesService _movieService = MoviesService();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;
  Future<void> fetchmovies() async {
    _movies = await _movieService.fetchmovies();
    notifyListeners();
  }
}
