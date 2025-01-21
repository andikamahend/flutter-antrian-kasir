// File: services/antrian_service.dart

import '../models/antrian_model.dart';

class AntrianService {
  // Data contoh antrian
  final List<AntrianModel> _antrian = [
    AntrianModel(id: 1, nama: "Pesanan 1", status: "Menunggu"),
    AntrianModel(id: 2, nama: "Pesanan 2", status: "Diproses"),
    AntrianModel(id: 3, nama: "Pesanan 3", status: "Selesai"),
    AntrianModel(id: 4, nama: "Pesanan 4", status: "Menunggu"),
  ];

  // Mendapatkan daftar antrian
  List<AntrianModel> getAntrian() {
    return _antrian;
  }

  // Mengubah status pesanan berdasarkan ID
  void ubahStatus(int id, String statusBaru) {
    final index = _antrian.indexWhere((item) => item.id == id);
    if (index != -1) {
      _antrian[index].status = statusBaru;
    }
  }
}
