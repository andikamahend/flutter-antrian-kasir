// File: services/riwayat_pesanan_service.dart

import '../models/riwayat_pesanan_model.dart';

class RiwayatPesananService {
  // Data riwayat pesanan (contoh)
  List<RiwayatPesananModel> getRiwayatPesanan() {
    return [
      RiwayatPesananModel(
        pelanggan: "Antonio",
        nomorMeja: 5,
        pesanan: "Nasi Goreng, Es Teh",
        tanggal: "2023-11-01",
        nomorPesanan: 1,
        totalHarga: "Rp 55000",
      ),
      RiwayatPesananModel(
        pelanggan: "Budi",
        nomorMeja: 3,
        pesanan: "Ayam Bakar, Jus Jeruk",
        tanggal: "2023-11-02",
        nomorPesanan: 2,
        totalHarga: "Rp 80000",
      ),
      RiwayatPesananModel(
        pelanggan: "Siti",
        nomorMeja: 8,
        pesanan: "Sate Ayam, Es Kopi",
        tanggal: "2023-11-03",
        nomorPesanan: 3,
        totalHarga: "Rp 70000",
      ),
    ];
  }
}
