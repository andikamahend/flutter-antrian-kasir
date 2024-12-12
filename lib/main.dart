// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman Login
import 'dashboard.dart'; // Import halaman Dashboard
import 'menu.dart'; // Import halaman Menu Utama
import 'daftar_antrian.dart'; // Import halaman Daftar Antrian
import 'tambah_pesanan.dart'; // Import halaman Tambah Pesanan
import 'akun.dart'; // Import halaman Pengaturan Akun
import 'riwayat.dart'; // Import halaman Riwayat Pesanan
import 'tambah_menu.dart'; // Import halaman Tambah Menu
import 'edit_menu.dart'; // Import halaman EditMenu
import 'listmenu.dart'; // Import halaman List Menu

void main() {
  runApp(const MyApp()); // Fungsi utama untuk menjalankan aplikasi
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kasir', // Judul aplikasi
      initialRoute: '/login', // Halaman awal aplikasi (Login Page)
      routes: {
        '/login': (context) => const LoginPage(), // Rute untuk halaman login
        '/dashboard': (context) => const DashboardPage(), // Rute untuk halaman dashboard
        '/menu': (context) => const MainMenuPage(), // Rute untuk halaman menu utama
        '/daftarAntrian': (context) => const DaftarAntrianPage(), // Rute untuk halaman daftar antrian
        '/tambahPesanan': (context) => const OrderPage(menuItems: [],), // Rute untuk halaman tambah pesanan
        '/akun': (context) => PengaturanAkunPage(), // Rute untuk halaman pengaturan akun
        '/riwayat': (context) => const RiwayatPesananPage(), // Rute untuk halaman riwayat pesanan
        '/tambahMenu': (context) => const UploadMenuPage(), // Rute untuk halaman tambah menu
        '/editMenu': (context) => const EditMenuPage(namaMenu: '', harga: '',), // Rute untuk halaman edit menu
        '/listmenu': (context) => const ListMenuPage(), // Rute untuk halaman
      },
    );
  }
}
