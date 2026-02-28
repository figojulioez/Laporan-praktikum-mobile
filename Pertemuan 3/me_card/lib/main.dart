// berfungsi untuk import Component yang dibutuhkan
import 'package:flutter/material.dart';

// berfungsi untuk prosedur pada widget MainApp menandakan widget tersebut merupakan widget utama
void main() {
  runApp(const MyApp());
}

// Mendeklarasikan widget yang mereferensi pada StatelessWidget
class MyApp extends StatelessWidget {
  // Deklarasi super key atau atrbut parent
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Komponen utama widget tree 
    return MaterialApp(
      // Untuk Area yang melindungi widget child miliknya
      home : Scaffold(
        // Melindungi elemen anaknya dalam batas wajar agar tidak terkena popup hp
        body: 
        // Membungkus elemen anaknya dan di sejajarkan secara horizontal
          Row(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            // Container pertama
            Container(
            height: 120,
            width: 80,  
            color: Colors.red,
            child: Text("Container 1"),
            ),

            // Container kedua diberikan lebar yang lebih besar
            // maka ukuruan col akan mengikuti lebar terbesar
            Container(
            height: 120,
            width: 80,
            color: Colors.amber,
            child: Text("Container 2"),
            ),
            
            // Untuk memberi jarak
            SizedBox(width: 20,),

            // Container ketiga
            Container(
            height: 120,
            width: 80,
            color: Colors.blue,
            child: Text("Container 3"),
            ),
            
            // Container ke empat
            Container(
            height: 120,
            width: 80,
            color: Colors.yellow,
            child: Text("Container 4"),
            )
            ]
          ,),
        ),
    );
  }
}