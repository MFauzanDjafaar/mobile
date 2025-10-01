 import 'dart:io';

void main() {
  // Meminta input umur dari pengguna
  stdout.write("Masukkan umur Anda: ");
  String? input = stdin.readLineSync();

  // Konversi input ke integer
  int? umur = int.tryParse(input ?? "");

  // Validasi input
  if (umur == null) {
    print("Input tidak valid! Harap masukkan angka.");
    return;
  } else if (umur < 0) {
    print("Error: Umur tidak boleh negatif.");
    return;
  }

  // Menentukan kategori umur
  String kategori;
  if (umur <= 12) {
    kategori = "Anak-anak";
  } else if (umur <= 17) {
    kategori = "Remaja";
  } else if (umur <= 59) {
    kategori = "Dewasa";
  } else {
    kategori = "Lansia";
  }

  // Menampilkan hasil
  print("Anda termasuk kategori $kategori");
}
