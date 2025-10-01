import 'dart:io';

void main() {
  // Meminta input skor dari pengguna
  stdout.write("Masukkan skor Anda (0 - 100): ");
  String? input = stdin.readLineSync();

  // Konversi input ke integer
  int? skor = int.tryParse(input ?? "");

  // Validasi input
  if (skor == null) {
    print("Input tidak valid! Harap masukkan angka.");
    return;
  } else if (skor < 0 || skor > 100) {
    print("Error: Skor harus berada pada rentang 0 - 100.");
    return;
  }

  // Menentukan grade berdasarkan skor
  String grade;
  if (skor >= 85 && skor <= 100) {
    grade = "A";
  } else if (skor >= 70) {
    grade = "B";
  } else if (skor >= 60) {
    grade = "C";
  } else if (skor >= 50) {
    grade = "D";
  } else {
    grade = "E";
  }

  // Menampilkan hasil
  print("Skor Anda: $skor");
  print("Grade Anda: $grade");
}
