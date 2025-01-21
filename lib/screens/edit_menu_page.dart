import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../services/menu_service.dart';

class EditMenuPage extends StatefulWidget {
  final int menuIndex; // Indeks menu yang sedang diedit

  const EditMenuPage({super.key, required this.menuIndex});

  @override
  // ignore: library_private_types_in_public_api
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  late TextEditingController _namaMenuController;
  late TextEditingController _hargaController;
  final MenuService _menuService = MenuService();
  late MenuModel menu;

  @override
  void initState() {
    super.initState();
    menu = _menuService.getMenuList()[widget.menuIndex];
    _namaMenuController = TextEditingController(text: menu.namaMenu);
    _hargaController = TextEditingController(text: menu.harga);
  }

  void _saveChanges() {
    final updatedNamaMenu = _namaMenuController.text;
    final updatedHarga = _hargaController.text;

    if (updatedNamaMenu.isEmpty || updatedHarga.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi.")),
      );
    } else {
      _menuService.updateMenu(
        widget.menuIndex,
        MenuModel(namaMenu: updatedNamaMenu, harga: updatedHarga),
      );
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Menu"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Menu
            TextField(
              controller: _namaMenuController,
              decoration: const InputDecoration(
                labelText: "Nama Menu",
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Harga
            TextField(
              controller: _hargaController,
              decoration: const InputDecoration(
                labelText: "Harga",
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            // Tombol Update
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
