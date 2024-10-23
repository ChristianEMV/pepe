import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eru1/viewmodels/movie_viewmodel.dart';
import 'package:eru1/models/movies.dart';
import 'package:eru1/views/movie_details.dart';
import 'package:eru1/views/movie_list_item.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  late Future<void> _fetchMoviesFuture;

  @override
  void initState() {
    super.initState();
    _fetchMoviesFuture = Provider.of<MovieViewmodel>(context, listen: false).fetchmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Películas 🎬'),
      ),
      body: FutureBuilder(
        future: _fetchMoviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Consumer<MovieViewmodel>(
              builder: (context, viewModel, child) {
                return ListView.builder(
                  itemCount: viewModel.movies.length,
                  itemBuilder: (context, index) {
                    final movie = viewModel.movies[index];
                    return MovieListItem(movie: movie); // Usa el nuevo widget
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}