import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Kasir"), // Menampilkan judul pada AppBar
        centerTitle: true, // Mengatur judul agar berada di tengah
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Menambahkan jarak dari AppBar ke konten utama

          // Bagian Foto Profil dan Nama Tempat
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50, // Ukuran radius dari foto profil
                  backgroundImage: AssetImage('images/profil.jpg'), // Menampilkan gambar profil
                ),
                SizedBox(height: 10), // Jarak antara foto profil dan nama tempat
                Text(
                  "Warmindo 999", // Nama tempat yang ditampilkan
                  style: TextStyle(
                    fontSize: 20, // Ukuran font untuk nama tempat
                    fontWeight: FontWeight.bold, // Menjadikan teks nama tempat tebal
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30), // Jarak antara profil dan bagian menu

          // Bagian List Informasi Karyawan dan Navigasi Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding untuk ListView
              children: [
                // Informasi ID Karyawan
                const ListTile(
                  leading: Icon(Icons.perm_identity, color: Colors.green), // Ikon untuk ID Karyawan
                  title: Text("ID Karyawan : 0001"), // Menampilkan ID karyawan
                ),
                // Informasi Nama Karyawan
                const ListTile(
                  leading: Icon(Icons.person, color: Colors.blue), // Ikon untuk nama karyawan
                  title: Text("Nama : Antonio"), // Menampilkan nama karyawan
                ),
                // Navigasi Menu
                ListTile(
                  leading: const Icon(Icons.menu, color: Colors.orange), // Ikon untuk menu
                  title: const Text("Menu"), // Teks untuk navigasi menu
                  onTap: () => Navigator.pushNamed(context, '/menu'), // Navigasi ke halaman '/menu' saat ListTile di-tap
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
