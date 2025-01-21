// File: services/user_service.dart

import '../models/user_model.dart';

class UserService {
  UserModel _currentUser = UserModel(nama: "Antonio", password: "12345");

  // Mendapatkan pengguna saat ini
  UserModel getCurrentUser() {
    return _currentUser;
  }

  // Memperbarui kata sandi pengguna
  bool updatePassword(String oldPassword, String newPassword) {
    if (_currentUser.password == oldPassword) {
      _currentUser = UserModel(nama: _currentUser.nama, password: newPassword);
      return true;
    }
    return false; // Jika kata sandi lama salah
  }
}
