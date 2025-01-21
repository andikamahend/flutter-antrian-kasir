// File: services/auth_service.dart

import '../models/users_model.dart';

class AuthService {
  // Data pengguna contoh
  final List<UserModel> _users = [
    UserModel(username: "kasir1", password: "12345"),
    UserModel(username: "kasir2", password: "54321"),
  ];

  // Fungsi untuk memvalidasi login
  bool login(String username, String password) {
    return _users.any((user) => user.username == username && user.password == password);
  }
}
