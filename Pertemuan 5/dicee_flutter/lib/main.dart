  // berfungsi untuk import Component yang dibutuhkan
  import 'package:flutter/material.dart';
  // berfungsi untuk import fungsi - fungsi matematika dart
  import 'dart:math';

  // berfungsi untuk prosedur pada widget MainApp menandakan widget tersebut merupakan widget utama
  void main() {
    runApp(MyApp());
  }

// Mendeklarasikan widget yang mereferensi pada statefulwidget
class MyApp extends StatefulWidget {
  // deklarasi super key
  const MyApp({super.key});

  @override
  // instansi class child yang menjadi state
  State<MyApp> createState() => MyChildState();
}

  // Mendeklarasikan widget yang mereferensi pada StatelessWidget
  class MyChildState extends State<MyApp> {

    // Membuat sebuah variabel untuk menandakan gambar berapa
    var leftDiceNumber = 1;
    var rightDiceNumber = 1;

    // Function untuk selalu mengacak number
    void randomNumber() {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
       });
    }

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      // Komponen utama widget tree
      return MaterialApp(
        // berfungsi menjadi wadah komponen material design
        home: Scaffold(
          // Berfungsi membuat sebuah AppBar untuk menampilkan informasi heading
          appBar: AppBar(
            // Mewarnai background AppBar
            backgroundColor: Colors.lightBlue,
            // Menampilkan heading dari AppBar berupa tulisan
            title: Text(
              "Dicee",
              // Memberikan style pada heading dengan memberikan style bold dan warna hitam pada tulisan
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          // Membuat setiap elemen tepat berada di tengah
          body: Center(
            // Membuat sebuah row untuk menyusun gambar
            child: Row(children: [
              // Menampilkan gambar dadu pertama
              // Membuat agar ukuran dadu menysuaikan dengan ruang kosong
              Expanded( 
                // Membungkus gambar dengan text button agar dapat di klik
                child: TextButton(
                  onPressed: () {
                    randomNumber();
                  },
                  child: Image(image: 
                  // Mencari source gambar di lokal direktori
                    AssetImage('images/dice$leftDiceNumber.png'),
                    // Memberikan warna pada gambar png
                    color: Colors.black,
                    // Memberi ukuran untuk gambar
                    ),
                )
              ),
            
              // Menampilkan gambar dadu kedua
              // Membuat agar ukuran dadu menysuaikan dengan ruang kosong
              Expanded( 
                // Membungkus gambar dengan text button agar dapat di klik
                child: TextButton(
                  onPressed: () {
                    randomNumber();
                  },
                  child: Image(image: 
                  // Mencari source gambar di lokal direktori
                    AssetImage('images/dice$rightDiceNumber.png'),
                    // Memberikan warna pada gambar png
                    color: Colors.black,
                    // Memberi ukuran untuk gambar
                    ),
                )
              ),   
            ],),
          ),
        )
      );
    }
  }