// ====== Smart Ride APP=======

// Kelas abstrak Transportasi
abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar; //Getter untuk tarif dasar

  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() =>
      print("[$id] $nama - Kapasitas: $kapasitas, Tarif Dasar: $_tarifDasar");
}

// Kelas Turunan

// Taksi: tarif = tarifDasar * jarak
class Taksi extends Transportasi {
  double jarak;
  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
      : super(id, nama, tarifDasar, kapasitas);
  
  @override
  double hitungTarif(int jumlahPenumpang) => tarifDasar * jarak;
}

// Bus: tarif = (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0)
class Bus extends Transportasi {
  bool adaWifi;
  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
      : super(id, nama, tarifDasar, kapasitas);
  
  @override
  double hitungTarif(int jumlahPenumpang) =>
      (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
}

// Pesawat: tarif = tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1)
class Pesawat extends Transportasi {
  String kelas;
  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
      : super(id, nama, tarifDasar, kapasitas);
  
  @override
  double hitungTarif(int jumlahPenumpang) =>
      tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1);
}

// Kelas Pemesanan
class Pemesanan {
  String idPemesanan, namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang, this.totalTarif);

  void cetakStruk() {
    print("Pemesanan $idPemesanan: ${transportasi.nama} untuk $namaPelanggan - Total: Rp$totalTarif");
  }
}

// Fungsi Global

// Membuat objek pemesanan baru berdasarkan jenis transportasi
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  if (jumlahPenumpang > t.kapasitas) {
    print("Jumlah penumpang melebihi kapasitas (${t.kapasitas})!");
  }

  double total = t.hitungTarif(jumlahPenumpang);
  return Pemesanan("P001", nama, t, jumlahPenumpang, total);
}

// Menampilkan semua riwayat pemesanan
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print("\n=== Riwayat Pemesanan ===");
  for (var p in daftar) p.cetakStruk();
}

// ==== main program ===
void main() {
  // Membuat objek transportasi
  var taksi = Taksi("T1", "Taksi BlueBrid", 8000, 4, 10);
  var bus = Bus("B1", "Bus TransJakarta", 15000, 30, true);
  var pesawat = Pesawat("P1", "Garuda Indonesia", 150000, 100, "Bisnis");

  // Membuat daftar pemesanan
  var daftar = [
    buatPemesanan(taksi, "Andi", 1),
    buatPemesanan(bus, "Budi", 3 ),
    buatPemesanan(pesawat, "Citra", 2),
  ];

  // Menampilkan hasil pemesanan
  tampilSemuaPemesanan(daftar);
}