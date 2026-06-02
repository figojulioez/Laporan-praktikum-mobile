// Import flutter
import 'package:flutter/material.dart';
import 'movie_model.dart';

// Halaman detail film
class MovieDetailPage extends StatelessWidget {
  // Menampung data film
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("https://image.tmdb.org/t/p/w500${movie.posterPath}"),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(movie.overview),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
