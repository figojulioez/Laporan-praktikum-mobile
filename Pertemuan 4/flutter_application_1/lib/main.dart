// berfungsi untuk import Component yang dibutuhkan
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
       // Untuk Area yang melindungi widget child miliknya dari poni kamera
      home: SafeArea(child: 
        // berfungsi menjadi wadah komponen material design
        Scaffold(
          backgroundColor: Colors.blueAccent,
          body: 
        // Berfungsi membuat sebuah column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Berfungsi untuk membuat avatar lingkaran
            CircleAvatar(radius: 50, backgroundImage:
              // Berfungsi untuk menambahkan alamat gambar 
              AssetImage('./images/profile.jpeg')
            ),
            // Menambahkan Nama
            Text("Candieta Figo", style: GoogleFonts.pacifico(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            ),
            // Menambahkan tulisan ANDROID DEVELOPER
            Text("ANDROID DEVELOPER", style: GoogleFonts.sourceSans3(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5
              )
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            // Menyusun widget dalam bentuk horizontal
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric( horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(children: [
                Icon(
                  Icons.phone, color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("081234567890", style: GoogleFonts.sourceSans3(
                  fontSize: 20,
                  ),
                )
              ],),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric( horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(children: [
                Icon(
                  Icons.email, color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("figo123@gmail.com", style: GoogleFonts.sourceSans3(
                  fontSize: 20,
                  ),
                )
              ],),
            )
          ],)
        )
      )
    );
  }
}