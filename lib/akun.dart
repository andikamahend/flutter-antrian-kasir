import 'package:flutter/material.dart';

class PengaturanAkunPage extends StatelessWidget {
  PengaturanAkunPage({super.key});

  // form input
  final TextEditingController namaBaruController = TextEditingController(); // Controller untuk nama baru
  final TextEditingController passwordLamaController = TextEditingController(); // Controller untuk kata sandi lama
  final TextEditingController passwordBaruController = TextEditingController(); // Controller untuk kata sandi baru

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Akun"), // Judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Memberikan padding di sekitar body
        child: Column(
          children: [
            // Bagian profil (Foto dan Nama Pengguna di tengah)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen di tengah
                children: [
                  CircleAvatar(
                    radius: 50, // Ukuran radius avatar
                    backgroundImage: AssetImage('images/profil.jpg'), // Gambar profil pengguna
                  ),
                  SizedBox(height: 10), // Jarak antara avatar dan nama
                  Text(
                    "Antonio", // Nama pengguna
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Gaya teks untuk nama
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Jarak antara profil dan bagian ubah kata sandi

            // Bagian Ubah Kata Sandi
            const Text(
              "Ubah Kata Sandi", // Judul untuk bagian ubah kata sandi
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Gaya teks untuk judul
            ),
            const SizedBox(height: 10), // Jarak antara judul dan input kata sandi lama
            TextField(
              controller: passwordLamaController, // Controller untuk input kata sandi lama
              decoration: const InputDecoration(
                labelText: "Kata Sandi Lama", // Label untuk input
                prefixIcon: Icon(Icons.lock), // Ikon kunci di sebelah kiri input
              ),
              obscureText: true, // Sembunyikan teks input
            ),
            const SizedBox(height: 10), // Jarak antara input kata sandi lama dan baru
            TextField(
              controller: passwordBaruController, // Controller untuk input kata sandi baru
              decoration: const InputDecoration(
                labelText: "Kata Sandi Baru", // Label untuk input
                prefixIcon: Icon(Icons.lock), // Ikon kunci di sebelah kiri input
              ),
              obscureText: true, // Sembunyikan teks input
            ),
            const SizedBox(height: 10), // Jarak antara input kata sandi baru dan tombol
            ElevatedButton(
              onPressed: () {
              },
              child: const Text("Ubah Kata Sandi"), // Teks pada tombol
            ),
          ],
        ),
      ),
    );
  }
}
