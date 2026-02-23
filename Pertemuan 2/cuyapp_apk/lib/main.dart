import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // Home berfungsi sebagai widget utama yang ditampilkan
        home : Scaffold(
        // Berfungsi untuk menampilkan AppBar
          appBar: AppBar( 
               // Berfungsi untuk menampilkan judul dari AppBar
              title: Text("Belajar Widget Flutter"),),
               // Berfungsi untuk menampilkan Widget pada isi dari scaffold
          body: Center(
            child: Image(image: 
            // Menampilkan Image lewat url
              AssetImage("assets/anakKecil.jpg")
            ) 
          ),
      )
    );
  }
}