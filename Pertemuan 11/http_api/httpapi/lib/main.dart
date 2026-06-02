// Import flutter
import 'package:flutter/material.dart';
import 'movie_list_page.dart';

// Fungsi utama program
void main() {
  // Menjalankan aplikasi
  runApp(MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieListPage(),
    );
  }
}
