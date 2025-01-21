// File: screens/upload_menu_page.dart

import 'package:flutter/material.dart';
import '../services/tambah_menu_service.dart';
import '../models/tambah_menu_model.dart';

class UploadMenuPage extends StatefulWidget {
  const UploadMenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadMenuPageState createState() => _UploadMenuPageState();
}

class _UploadMenuPageState extends State<UploadMenuPage> {
  final TextEditingController _namaMenuController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final MenuService _menuService = MenuService();

  // Fungsi untuk mengunggah menu
  void _uploadMenu() {
    final String namaMenu = _namaMenuController.text;
    final String harga = _hargaController.text;

    if (namaMenu.isEmpty || harga.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama menu dan harga harus diisi!")),
      );
      return;
    }

    final newMenu = MenuModel(namaMenu: namaMenu, harga: harga);
    _menuService.uploadMenu(newMenu);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Menu berhasil diunggah!")),
    );

    _namaMenuController.clear();
    _hargaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Upload Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input nama menu
            TextField(
              controller: _namaMenuController,
              decoration: const InputDecoration(
                labelText: 'Nama Menu',
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Input harga
            TextField(
              controller: _hargaController,
              decoration: const InputDecoration(
                labelText: 'Harga',
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            // Tombol aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editMenu'); // Navigasi ke halaman Edit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: _uploadMenu,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text('Upload'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
