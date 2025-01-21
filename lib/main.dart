// File: main.dart

import 'package:flutter/material.dart';

// Import screens dari folder screens
import 'screens/login_page.dart';
import 'screens/dashboard_page.dart';
import 'screens/main_menu_page.dart';
import 'screens/daftar_antrian_page.dart';
import 'screens/order_page.dart';
import 'screens/pengaturan_akun_page.dart';
import 'screens/riwayat_pesanan_page.dart';
import 'screens/upload_menu_page.dart';
import 'screens/edit_menu_page.dart';
import'screens/daftar_menu_page.dart';
import 'screens/receipt_page.dart';

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
        '/login': (context) => LoginPage(), // Rute untuk halaman login
        '/dashboard': (context) => const DashboardPage(), // Rute untuk halaman dashboard
        '/menu': (context) => const MainMenuPage(), // Rute untuk halaman menu utama
        '/daftarAntrian': (context) => const DaftarAntrianPage(), // Rute untuk halaman daftar antrian
        '/tambahPesanan': (context) => const OrderPage(), // Rute untuk halaman tambah pesanan
        '/akun': (context) => PengaturanAkunPage(), // Rute untuk halaman pengaturan akun
        '/riwayat': (context) => const RiwayatPesananPage(), // Rute untuk halaman riwayat pesanan
        '/tambahMenu': (context) => const UploadMenuPage(), // Rute untuk halaman tambah menu
        '/daftarMenu': (context) => const DaftarMenuPage(),
        '/editMenu': (context) => const EditMenuPage(menuIndex: 0), // Pass the menuIndex here
      },
    );
  }
}
