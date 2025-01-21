// File: services/karyawan_service.dart

import '../models/karyawan_model.dart';

class KaryawanService {
  // Data contoh karyawan
  final KaryawanModel _karyawan = KaryawanModel(id: "0001", nama: "Antonio");

  // Mendapatkan data karyawan saat ini
  KaryawanModel getKaryawan() {
    return _karyawan;
  }
}
