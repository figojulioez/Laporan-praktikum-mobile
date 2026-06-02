// Import package flutter
import 'package:flutter/material.dart';
import 'movie_service.dart';
import 'movie_model.dart';
import 'movie_detail_page.dart';

// Halaman daftar film
class MovieListPage extends StatelessWidget {
  // Memanggil service API
  final MovieService service = MovieService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Film"), centerTitle: true),
      body: FutureBuilder<List<MovieModel>>(
        future: service.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Terjadi Kesalahan"));
          }
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    width: 50,
                  ),
                  title: Text(movie.title),
                  subtitle: Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailPage(movie: movie),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
