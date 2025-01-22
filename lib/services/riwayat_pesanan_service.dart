// File: services/riwayat_pesanan_service.dart

import '../models/riwayat_pesanan_model.dart';

class RiwayatPesananService {
  // Data riwayat pesanan (contoh)
  List<RiwayatPesananModel> getRiwayatPesanan() {
    return [
      RiwayatPesananModel(
        pelanggan: "Antonio",
        nomorMeja: 5,
        pesanan: "Nasi Goreng Jumlah: 3, Es Teh Jumlah: 3",
        tanggal: "2023-11-01",
        nomorPesanan: 1,
        totalHarga: "Rp 55000",
      ),
      RiwayatPesananModel(
        pelanggan: "Budi",
        nomorMeja: 3,
        pesanan: "Ayam Bakar Jumlah: 5, Es Jeruk Jumlah: 4",
        tanggal: "2023-11-02",
        nomorPesanan: 2,
        totalHarga: "Rp 80000",
      ),
      RiwayatPesananModel(
        pelanggan: "Siti",
        nomorMeja: 8,
        pesanan: "Sate Ayam Jumlah: 4, Es Teh: 3, Es Jeruk Jumlah: 1",
        tanggal: "2023-11-03",
        nomorPesanan: 3,
        totalHarga: "Rp 70000",
      ),
    ];
  }
}
