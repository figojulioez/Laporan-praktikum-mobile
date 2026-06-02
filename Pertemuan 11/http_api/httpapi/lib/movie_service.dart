// Import package http
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

// Service untuk mengambil data dari API
class MovieService {
  // Ganti dengan API Key TMDB milik anda
  static const String apiKey = "86ac9cede3dc04c232f54b69cdaa83c5";
  // Endpoint film populer
  static const String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  // Method mengambil data film
  Future<List<MovieModel>> getMovies() async {
    // Mengirim request ke server
    final response = await http.get(Uri.parse(url));
    // Jika request berhasil
    if (response.statusCode == 200) {
      // Decode JSON
      final data = json.decode(response.body);
      // Mengambil list film
      List results = data['results'];
      // Mengubah JSON menjadi object
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    throw Exception('Gagal mengambil data');
  }
}
