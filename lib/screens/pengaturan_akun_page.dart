// File: screens/pengaturan_akun_page.dart

import 'package:flutter/material.dart';
import '../services/user_service.dart';

class PengaturanAkunPage extends StatelessWidget {
  PengaturanAkunPage({super.key});

  // Controller untuk form input
  final TextEditingController passwordLamaController = TextEditingController();
  final TextEditingController passwordBaruController = TextEditingController();

  final UserService _userService = UserService(); // Service pengguna

  @override
  Widget build(BuildContext context) {
    final user = _userService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Akun"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profil pengguna
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profil.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.nama, // Nama pengguna dari service
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Form Ubah Kata Sandi
            const Text(
              "Ubah Kata Sandi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordLamaController,
              decoration: const InputDecoration(
                labelText: "Kata Sandi Lama",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordBaruController,
              decoration: const InputDecoration(
                labelText: "Kata Sandi Baru",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final oldPassword = passwordLamaController.text;
                final newPassword = passwordBaruController.text;

                final isSuccess = _userService.updatePassword(oldPassword, newPassword);
                final message = isSuccess
                    ? "Kata sandi berhasil diubah!"
                    : "Kata sandi lama salah. Coba lagi.";

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Informasi"),
                    content: Text(message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Ubah Kata Sandi"),
            ),
          ],
        ),
      ),
    );
  }
}
