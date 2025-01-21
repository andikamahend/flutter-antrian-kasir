// File: screens/dashboard_page.dart

import 'package:flutter/material.dart';
import '../services/karyawan_service.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final KaryawanService karyawanService = KaryawanService();
    final karyawan = karyawanService.getKaryawan();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Kasir"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Bagian Foto Profil dan Nama Tempat
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profil.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  "Warmindo 999",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Bagian List Informasi Karyawan dan Navigasi Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                // Informasi ID Karyawan
                ListTile(
                  leading: const Icon(Icons.perm_identity, color: Colors.green),
                  title: Text("ID Karyawan : ${karyawan.id}"),
                ),
                // Informasi Nama Karyawan
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: Text("Nama : ${karyawan.nama}"),
                ),
                // Navigasi Menu
                ListTile(
                  leading: const Icon(Icons.menu, color: Colors.orange),
                  title: const Text("Menu"),
                  onTap: () => Navigator.pushNamed(context, '/menu'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
