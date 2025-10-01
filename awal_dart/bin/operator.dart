import "dart:io";

main() {
  stdout.write("Masukan nama:");
  String? nama = stdin.readLineSync();
  print("Nama saya : $nama");
}