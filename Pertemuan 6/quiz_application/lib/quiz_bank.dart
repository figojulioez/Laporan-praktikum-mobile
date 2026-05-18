import 'package:quiz_application/questions.dart';

class QuizBank {
  // Bank soal untuk menyimpan soal dan jawaban sekaligus menjadi satu
  List<Questions> _questionBank = [
    Questions(q: "Jika perut sudah bunyi karena lapar, kita bisa mengubahnya ke 'mode getar' agar tidak berisik", a: false),
    Questions(q: "Alasan lari pagi sangat melelahkan adalah karena makan mi instan pakai nasi tadi malam", a: true),
    Questions(q: "Darah warnanya neon", a: false)
  ];

  // Berfungsi untuk menyimpan halaman terkini
  int _questionNumbers = 0;

  // berfungsi untuk melanjutkan jawaban
  void nextQuestions() {
    if (_questionNumbers < _questionBank.length - 1) {
      _questionNumbers++;
    }
    
  }

  // Berfungsi untuk enkapsulasi pertanyaan karena properti dibuat privat
  String getQuestionText() {
    return _questionBank[_questionNumbers].questionText;
  }

  // Berfungsi untuk enkapsulasi jawaban karena properti dibuat privat
  bool getQuestionAnswer() {
    return _questionBank[_questionNumbers].questionAnswer;
  }
}