import 'dart:convert';
import 'dart:io';

void main() {
  // Data JSON sederhana
  String jsonData = '{"nama":"Fauzan","umur":21,"status":"Mahasiswa"}';

  // Decode JSON
  var data = jsonDecode(jsonData);

  // Tampilkan hasil di terminal
  print("Nama   : ${data['nama']}");
  print("Umur   : ${data['umur']}");
  print("Status : ${data['status']}");
}
