import 'dart:io';

void main() {
  // Daftar menu makanan
  Map<int, Map<String, dynamic>> makanan = {
    1: {"nama": "Ayam Goreng", "harga": 20000},
    2: {"nama": "Nasi Goreng", "harga": 15000},
    3: {"nama": "Mie Goreng", "harga": 12000},
  };

  // Daftar menu minuman
  Map<int, Map<String, dynamic>> minuman = {
    1: {"nama": "Es Teh", "harga": 5000},
    2: {"nama": "Es Jeruk", "harga": 7000},
    3: {"nama": "Air Mineral", "harga": 4000},
  };

  bool lanjut = true;

  while (lanjut) {
    print("===== MENU MAKANAN =====");
    makanan.forEach((key, value) {
      print("$key. ${value['nama']} - Rp${value['harga']}");
    });

    stdout.write("Pilih makanan (angka): ");
    int pilihMakanan = int.parse(stdin.readLineSync()!);

    if (!makanan.containsKey(pilihMakanan)) {
      print("Pilihan makanan tidak tersedia!");
      continue;
    }

    print("===== MENU MINUMAN =====");
    minuman.forEach((key, value) {
      print("$key. ${value['nama']} - Rp${value['harga']}");
    });

    stdout.write("Pilih minuman (angka): ");
    int pilihMinuman = int.parse(stdin.readLineSync()!);

    if (!minuman.containsKey(pilihMinuman)) {
      print("Pilihan minuman tidak tersedia!");
      continue;
    }

    int total = makanan[pilihMakanan]!["harga"] + minuman[pilihMinuman]!["harga"];

    print("\nPesanan Anda:");
    print("- ${makanan[pilihMakanan]!['nama']} : Rp${makanan[pilihMakanan]!['harga']}");
    print("- ${minuman[pilihMinuman]!['nama']} : Rp${minuman[pilihMinuman]!['harga']}");
    print("Total harga: Rp$total");

    // Proses pembayaran
    stdout.write("Masukkan uang pembayaran: ");
    int bayar = int.parse(stdin.readLineSync()!);

    if (bayar >= total) {
      int kembalian = bayar - total;
      print("Pembayaran berhasil! Kembalian: Rp$kembalian");
    } else {
      print("Uang tidak cukup! Transaksi dibatalkan.");
    }

    // Tanya apakah ingin transaksi lagi
    stdout.write("\nApakah ingin memesan lagi? (y/n): ");
    String? jawaban = stdin.readLineSync();

    if (jawaban == null || jawaban.toLowerCase() != "y") {
      lanjut = false;
      print("Terima kasih telah berkunjung!");
    }
  }
}
