import 'dart:io';

void main() {
  stdout.write("Masukkan angka: ");
  String? input = stdin.readLineSync();

  int? angka = int.tryParse(input ?? "0");
  if (angka == null) {
    print("Input tidak valid!");
  } else {
    print("Hasil kuadrat dari $angka adalah ${angka * angka}");
  }
}
