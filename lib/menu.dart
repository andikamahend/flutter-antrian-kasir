import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Utama"), // Menampilkan judul AppBar "Menu Utama"
        centerTitle: true, // Menempatkan judul di tengah AppBar
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Memberikan jarak antara AppBar dan konten utama

          // Bagian profil dan judul
          const Center(
            child: Column(
              children: [
                // Gambar profil tempat
                CircleAvatar(
                  radius: 50, // Ukuran radius dari foto profil
                  backgroundImage: AssetImage('images/Ayam_goreng.jpg'), // Menampilkan gambar profil
                ),
                SizedBox(height: 10), // Jarak antara gambar dan teks nama tempat
                Text(
                  "Warmindo 999", // Nama tempat
                  style: TextStyle(
                    fontSize: 20, // Ukuran font nama tempat
                    fontWeight: FontWeight.bold, // Membuat teks nama tempat tebal
                  ),
                ),
                SizedBox(height: 5), // Jarak antara nama tempat dan teks "Menu Kasir"
                Text(
                  "Menu Kasir", // Keterangan tambahan untuk menu kasir
                  style: TextStyle(
                    fontSize: 16, // Ukuran font keterangan
                    color: Colors.grey, // Warna teks keterangan
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30), // Jarak antara profil dan daftar menu

          // Daftar Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal untuk ListView
              children: [
                ListTile(
                  leading: const Icon(Icons.list_alt, color: Colors.blue), // Ikon untuk Tambah Pesanan
                  title: const Text("List Menu"), // Teks untuk Tambah Pesanan
                  onTap: () {
                    Navigator.pushNamed(context, '/listmenu'); // Navigasi ke halaman Tambah Pesanan
                  },
                ),

                // Tombol Tambah Pesanan
                ListTile(
                  leading: const Icon(Icons.add_shopping_cart, color: Colors.blue), // Ikon untuk Tambah Pesanan
                  title: const Text("Tambah Pesanan"), // Teks untuk Tambah Pesanan
                  onTap: () {
                    Navigator.pushNamed(context, '/tambahPesanan'); // Navigasi ke halaman Tambah Pesanan
                  },
                ),
                // Tombol Daftar Antrian
                ListTile(
                  leading: const Icon(Icons.format_list_bulleted, color: Colors.green), // Ikon untuk Daftar Antrian
                  title: const Text("Daftar Antrian"), // Teks untuk Daftar Antrian
                  onTap: () {
                    Navigator.pushNamed(context, '/daftarAntrian'); // Navigasi ke halaman Daftar Antrian
                  },
                ),
                // Tombol Riwayat Pesanan
                ListTile(
                  leading: const Icon(Icons.history, color: Colors.orange), // Ikon untuk Riwayat Pesanan
                  title: const Text("Riwayat Pesanan"), // Teks untuk Riwayat Pesanan
                  onTap: () {
                    Navigator.pushNamed(context, '/riwayat'); // Navigasi ke halaman Riwayat Pesanan
                  },
                ),
                // Tombol Tambah Menu
                ListTile(
                  leading: const Icon(Icons.create, color: Colors.blue), // Ikon untuk Tambah Pesanan
                  title: const Text("Tambah Menu"), // Teks untuk Tambah Pesanan
                  onTap: () {
                    Navigator.pushNamed(context, '/tambahMenu'); // Navigasi ke halaman Tambah Pesanan
                  },
                ),
                // Tombol Pengaturan Akun
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.purple), // Ikon untuk Pengaturan Akun
                  title: const Text("Pengaturan Akun"), // Teks untuk Pengaturan Akun
                  onTap: () {
                    Navigator.pushNamed(context, '/akun'); // Navigasi ke halaman Pengaturan Akun
                  },
                ),
              ],
            ),
          ),

          // Tombol Logout
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding di sekitar tombol logout
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navigasi kembali ke halaman login
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Padding untuk tombol
                backgroundColor: Colors.red, // Warna latar belakang tombol logout
                foregroundColor: Colors.black, // Warna teks tombol logout
              ),
              child: const Text("Logout"), // Teks yang ditampilkan pada tombol logout
            ),
          ),
        ],
      ),
    );
  }
}
