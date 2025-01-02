// ignore_for_file: library_private_types_in_public_api

import 'package:antriankasir/tambah_menu.dart';
import 'package:flutter/material.dart';

// Halaman untuk menampilkan daftar menu yang tersedia
class ListMenuPage extends StatefulWidget {
  const ListMenuPage({super.key});

  @override
  _ListMenuPageState createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  // Daftar menu yang akan ditampilkan
  final List<Map<String, dynamic>> menuList = [
    {"name": "Nasi Goreng", "price": 20000},
    {"name": "Mie Goreng", "price": 18000},
    {"name": "Ayam Goreng", "price": 25000},
    {"name": "Es Teh", "price": 5000},
    {"name": "Es Jeruk", "price": 7000},
  ];

  // Fungsi untuk menambahkan menu baru ke daftar
  void _addNewMenu(Map<String, dynamic> newMenu) {
    setState(() {
      menuList.add(newMenu); // Menambahkan menu ke dalam daftar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul dan tombol tambah menu
      appBar: AppBar(
        title: const Text("Tabel Menu"), // Judul halaman
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // Tombol tambah menu
            onPressed: () async {
              // Navigasi ke halaman tambah menu
              final newMenu = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UploadMenuPage()),
              );
              // Jika menu baru ditambahkan, tambahkan ke daftar menu
              if (newMenu != null) {
                _addNewMenu(newMenu);
              }
            },
          ),
        ],
      ),

      // Daftar menu yang ditampilkan dalam ListView
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: menuList.length, // Jumlah item di daftar menu
          separatorBuilder: (context, index) => const Divider(), // Garis pemisah antar item
          itemBuilder: (context, index) {
            final menu = menuList[index]; // Mengambil data menu berdasarkan index
            return ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Colors.green), // Ikon untuk setiap item
              title: Text(menu["name"]), // Nama menu
              trailing: Text(
                "Rp ${menu["price"]}", // Harga menu
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
