import 'package:eru1/views/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:eru1/models/movies.dart';

class MovieListItem extends StatefulWidget {
  final Movie movie;

  const MovieListItem({super.key, required this.movie});

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  bool _showDescription = false;

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Image.network(widget.movie.poster),
          title: Text(widget.movie.title),
          subtitle: Text('${widget.movie.year}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(movie: widget.movie),
              ),
            );
          },
        ),
        if (_showDescription)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.movie.description),
          ),
        TextButton(
          onPressed: _toggleDescription,
          child: Text(_showDescription ? 'Ocultar Descripción' : 'Mostrar Descripción'),
        ),
        const Divider(),
      ],
    );
  }
}