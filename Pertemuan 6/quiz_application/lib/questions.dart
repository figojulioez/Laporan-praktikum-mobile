// Class baru untuk menyimpan jawaban dan pertanyaan
class Questions {
  // Properti untuk menyimpan pertanyaan
  late String questionText;
  // Properti untuk menyimpan jawaban
  late bool questionAnswer;

  // Constructor function untuk menyimpan jawban dan pertanyaan saat baru di instansi
  Questions({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}