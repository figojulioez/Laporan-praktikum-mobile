// Import Package Library seluruh material dart
import 'package:flutter/material.dart';
import 'package:quiz_application/quiz_bank.dart';

// Instansi quiez bank
QuizBank quizBank = QuizBank();

// Menjalankan class widget yang akan menyususun struktur ui flutter
void main() {
  runApp(const MyApp());
}

// Class widget yang mengatur susunan struktur ui di flutter
class MyApp extends StatelessWidget {
  // Instansi propertu key
  const MyApp({super.key});

  // Overiding method build untuk menyususn struktur ui
  @override
  Widget build(BuildContext context) {
    // Berfungsi sebagai root widget utama
    return MaterialApp(
      // Berfungsi untuk mengatur tata letak dasar dan utama
      home: Scaffold(
        // berfungsi untuk memberikan warna background abu - abu
        backgroundColor: Colors.grey.shade900,
        // Berfungsi untuk mengatur tata letak agar berada pada daerah aman
        body: SafeArea(
          // Berfungsi sebagai widget parent yang memberikan padding pada widget childnya
          child: Padding(
            // Berfungsi untuk memberikan symmetric padding artinya padding hanya pada horizontal saja
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0),
            // Berfungsi menjadikan Quiz sebagai widget child padding dan ditampilkan dengan turunan padding
            child: Quiz(),
            )
          )
        )
      );
  }
}

// Instansi class stateful untuk menangani perubahan
class Quiz extends StatefulWidget {
  // Instansi properti key
  const Quiz({super.key});
 
  // Overiding method build untuk menyususn struktur ui
  @override
  State<Quiz> createState() => _QuizState();
}

// Turunan dari Quiz untuk menanganti setiap perubahan state
class _QuizState extends State<Quiz> {
// Berfungsi untuk menampilkan icon check dan close nantinya
  List<Widget> scoreKeeper = [];

  // Berfungsi untuk melihat jawaban user apakah benar atau salah
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBank.getQuestionAnswer();
    if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          )
      );
    } else {
      scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          )
      );
    }

    setState(() {
      quizBank.nextQuestions();
    });

  }
  


  @override
  Widget build(BuildContext context) {
    // Berfungsi untuk menampilkan column
    return Column(
      children: [
        // Berfungsi untuk memaksa widget child ketarik dengan widget expanded
        Expanded(
          // Befungsi untuk menampilkan widget padding
          child: Padding(
            // berfungsi untuk memberikan padding
            padding: EdgeInsets.all(10.0),
            // Berfungsi untuk menampilkan widget child berada di tengah
            child: Center(
              // Berfungsi untuk menampilkan tulisan
              child: Text(
                quizBank.getQuestionText(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  
                ),
                textAlign: TextAlign.center,
                ),
            ),
          ),
        ),
        // Berfungsi untuk menangani getstur event dari pemilik hp
        GestureDetector(
          // Apabila container di tekan akan menambahkan scoreKeeper icons check
          onTap: () {
            // Validasi apakah user benar atau salah dalam menjawab soal
            checkAnswer(true);
          },
          // Befungsi menampilkan container
          child: Container(
            // Kustomisasi ui container
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.all(15),
            height: 100,
            width: double.infinity,
            // Berfungsi untuk menampilkan tulisan tepat berada di tengah
            child: Center(
              child: Text(
                "True",
                // Berfungsi untuk mengatur style penulisan
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
          ),
        ),
        // Berfungsi untuk menangani getstur event dari pemilik hp
        GestureDetector(
          // Apabila container di tekan akan menambahkan scoreKeeper icons cose
          onTap: () {
            // Validasi apakah user benar atau salah dalam menjawab soal
            checkAnswer(false);
          },
          // Befungsi menampilkan container
          child: Container(
            // Kustomisasi ui container
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.all(15),
            height: 100,
            width: double.infinity,
            // Berfungsi untuk menampilkan tulisan tepat berada di tengah
            child: Center(
              child: Text(
                // Berfungsi untuk mengatur style penulisan
                "False",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
          ),
        ),
        // Berfungsi untuk menampilkan pesan benar atau salah nantinya dalam bentuk horizontal
        Row(
          children: scoreKeeper
          )
      ],
    );
  }
}